SELECT
    CASE
        WHEN person.name IS NOT NULL THEN person.name
        ELSE '-'
    END AS person_name,
    visit_date AS visit_date,
    CASE
        WHEN pizzeria.name IS NOT NULL THEN pizzeria.name
        ELSE '-'
    END AS pizzeria_name
FROM
    (
        SELECT
            *
        FROM
            person_visits
        WHERE
            visit_date BETWEEN '2022-01-01'
            AND '2022-01-03'
    ) AS pv FULL
    OUTER JOIN person ON pv.person_id = person.id
    AND visit_date BETWEEN '2022-01-01'
    AND '2022-01-03' FULL
    OUTER JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
ORDER BY
    person_name,
    visit_date,
    pizzeria_name;