WITH temp AS (
    SELECT
        person_order.person_id AS person_id,
        menu.pizzeria_id AS pizzeria_id,
        CASE
            WHEN COUNT(menu.pizzeria_id) = 1 THEN 10.5
            WHEN COUNT(menu.pizzeria_id) = 2 THEN 22
            ELSE 30
        END AS discount
    FROM
        person_order
        JOIN menu ON menu.id = person_order.menu_id
    GROUP BY
        person_order.person_id,
        menu.pizzeria_id
    ORDER BY
        person_id,
        pizzeria_id,
        discount
)

INSERT INTO
    person_discounts(id, person_id, pizzeria_id, discount)
SELECT
    ROW_NUMBER() OVER() AS id,
    temp.person_id AS person_id,
    temp.pizzeria_id AS pizzeria_id,
    temp.discount AS discount
FROM
    temp
ORDER BY
    id;

-- SELECT
--     *
-- FROM
--     person_discounts;