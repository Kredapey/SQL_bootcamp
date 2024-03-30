WITH male_g AS (
    SELECT
        pizzeria.name AS pizzeria_name
    FROM
        person_visits pv
        JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
        JOIN person p ON p.id = pv.person_id
    WHERE
        p.gender = 'male'
),
female_g AS (
    SELECT
        pizzeria.name AS pizzeria_name
    FROM
        person_visits pv
        JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
        JOIN person p ON p.id = pv.person_id
    WHERE
        p.gender = 'female'
) (
    SELECT
        pizzeria_name
    FROM
        male_g
    EXCEPT
        ALL
    SELECT
        pizzeria_name
    FROM
        female_g
)
UNION
ALL (
    SELECT
        pizzeria_name
    FROM
        female_g
    EXCEPT
        ALL
    SELECT
        pizzeria_name
    FROM
        male_g
)
ORDER BY
    pizzeria_name;