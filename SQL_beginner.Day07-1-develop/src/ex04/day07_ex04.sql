SELECT
    person.name AS name,
    COUNT(pv.pizzeria_id) AS count_of_visits
FROM
    person_visits pv
    JOIN person ON person.id = pv.person_id
GROUP BY
    person.name
HAVING
    COUNT(pv.pizzeria_id) > 3
ORDER BY
    count_of_visits DESC,
    name ASC