SELECT
    order_date AS action_date,
    (
        SELECT
            name
        FROM
            person
        WHERE
            person_order.person_id = id
    ) as person_name
FROM
    person_order
INTERSECT
ALL
SELECT
    visit_date,
    (
        SELECT
            name
        FROM
            person
        WHERE
            person_visits.person_id = id
    ) as person_name
FROM
    person_visits
ORDER BY
    action_date ASC,
    person_name DESC;