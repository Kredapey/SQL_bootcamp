WITH male_g AS (
    SELECT
        pizzeria.name AS pizzeria_name
    FROM
        person_order po
        JOIN menu ON menu.id = po.menu_id
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
        JOIN person ON person.id = po.person_id
    WHERE
        person.gender = 'male'
),
female_g AS (
    SELECT
        pizzeria.name AS pizzeria_name
    FROM
        person_order po
        JOIN menu ON menu.id = po.menu_id
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
        JOIN person ON person.id = po.person_id
    WHERE
        person.gender = 'female'
) (
    SELECT
        pizzeria_name
    FROM
        male_g
    EXCEPT
    SELECT
        pizzeria_name
    FROM
        female_g
)
UNION
(
    SELECT
        pizzeria_name
    FROM
        female_g
    EXCEPT
    SELECT
        pizzeria_name
    FROM
        male_g
)
ORDER BY
    pizzeria_name;