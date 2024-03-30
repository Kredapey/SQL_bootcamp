WITH visit_p AS (
    SELECT
        pizzeria.name AS pizzeria_name
    FROM
        person_visits pv
        JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
        JOIN person ON person.id = pv.person_id
    WHERE
        person.name = 'Andrey'
),
order_p AS (
    SELECT
        pizzeria.name AS pizzeria_name
    FROM
        person_order po
        JOIN menu ON menu.id = po.menu_id
        JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
        JOIN person ON po.person_id = person.id
    WHERE
        person.name = 'Andrey'
)
SELECT
    pizzeria_name
FROM
    visit_p
EXCEPT
SELECT
    pizzeria_name
FROM
    order_p
ORDER BY
    pizzeria_name;