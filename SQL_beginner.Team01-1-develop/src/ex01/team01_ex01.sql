INSERT INTO currency
VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');

INSERT INTO currency
VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH all_transactions AS (
    SELECT
        user_id,
        money,
        currency.rate_to_usd AS rate,
        currency.name AS currency_name,
        balance.updated AS balance_date,
        currency.updated AS currency_date,
        (balance.updated - currency.updated) AS time_scale
    FROM currency
    JOIN balance ON currency.id = balance.currency_id
),
old_transactions AS (
    SELECT
        user_id,
        money,
        currency_name,
        MIN(time_scale) AS old_date
    FROM all_transactions
    WHERE time_scale > '0 days'
    GROUP BY user_id, money, currency_name
),
new_transactions AS (
    SELECT
        user_id,
        money,
        currency_name,
        MAX(time_scale) AS new_date
    FROM all_transactions
    WHERE time_scale < '0 days'
    GROUP BY user_id, money, currency_name
),
actual_dates_for_rates AS (
    SELECT
        new_transactions.user_id AS user_id,
        new_transactions.money AS money,
        new_transactions.currency_name AS currency_name,
        COALESCE(old_date, new_date) AS actual_date
    FROM new_transactions
    FULL JOIN old_transactions
        ON new_transactions.user_id = old_transactions.user_id
        AND new_transactions.money = old_transactions.money
        AND new_transactions.currency_name = old_transactions.currency_name
),
output_table AS (
    SELECT
        COALESCE(u.name, 'not defined') AS name,
        COALESCE(u.lastname, 'not defined') AS lastname,
        result.currency_name,
        a_t.rate * result.money AS currency_in_usd
    FROM actual_dates_for_rates AS result
    LEFT JOIN "user" u ON u.id = user_id
    LEFT JOIN all_transactions AS a_t
        ON time_scale = actual_date
        AND a_t.money = result.money
        AND a_t.currency_name = result.currency_name
)
SELECT *
FROM output_table
ORDER BY name DESC, lastname ASC, currency_name ASC;
