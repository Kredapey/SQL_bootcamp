SELECT
    person.name AS name,
    COUNT(pv.pizzeria_id) AS count_of_visits
FROM
    person_visits pv
    JOIN person ON person.id = pv.person_id
GROUP BY
    person.name
ORDER BY
    count_of_visits DESC,
    name ASC
LIMIT
    4;