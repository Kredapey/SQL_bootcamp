SELECT
    order_date,
    concat(name, ' (age:', age, ')') AS person_information
FROM
    person_order NATURAL
    JOIN (
        SELECT
            name,
            age,
            id AS person_id
        FROM
            person
    ) AS new_person
ORDER BY
    order_date ASC,
    person_information ASC;