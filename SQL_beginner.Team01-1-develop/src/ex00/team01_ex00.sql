WITH user_name AS (
    SELECT
        COALESCE(usr.name, 'not defined') AS name,
        COALESCE(usr.lastname, 'not defined') AS lastname,
        b.type AS type,
        SUM(b.money) AS volume,
        b.currency_id
    FROM
        "user" usr FULL
        JOIN balance b ON b.user_id = usr.id
    GROUP BY
        COALESCE(usr.name, 'not defined'),
        COALESCE(usr.lastname, 'not defined'),
        b.type,
        b.currency_id
    ORDER BY
        name DESC,
        lastname ASC,
        type ASC
),
cur_name AS (
    SELECT
        un.name,
        un.lastname,
        un.type,
        un.volume,
        COALESCE(cur.name, 'not defined') AS currency_name
    FROM
        currency cur
        RIGHT JOIN user_name un ON un.currency_id = cur.id
    GROUP BY
        un.name,
        un.lastname,
        un.type,
        un.volume,
        COALESCE(cur.name, 'not defined')
    ORDER BY
        name DESC,
        lastname ASC,
        type ASC
),
max_date AS (
    SELECT
        name,
        MAX(updated) AS date
    FROM
        currency
    GROUP BY
        name
),
opt_currency AS (
    SELECT
        c.name AS name,
        c.rate_to_usd
    FROM
        currency c
        JOIN max_date ON c.name = max_date.name
        AND c.updated = max_date.date
),
overall AS (
    SELECT
        cn.name,
        cn.lastname,
        cn.type,
        cn.volume,
        cn.currency_name,
        COALESCE(oc.rate_to_usd, 1) AS last_rate_to_usd,
        ROUND((volume * COALESCE(oc.rate_to_usd, 1))) AS total_volume_in_usd
    FROM
        cur_name cn
        LEFT JOIN opt_currency oc ON cn.currency_name = oc.name
    GROUP BY
        cn.name,
        cn.lastname,
        cn.type,
        cn.volume,
        cn.currency_name,
        COALESCE(oc.rate_to_usd, 1)
    ORDER BY
        name DESC,
        lastname ASC,
        type ASC
)
SELECT
    *
FROM
    overall;