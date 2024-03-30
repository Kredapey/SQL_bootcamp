SELECT
    missing_date
FROM
    (
        SELECT
            missing_date :: date
        FROM
            GENERATE_SERIES('2022-01-01', '2022-01-10', interval '1 day') AS missing_date
    ) as mis_date
    LEFT JOIN person_visits pv ON mis_date.missing_date = pv.visit_date
    AND (
        pv.person_id = 1
        OR pv.person_id = 2
    )
WHERE
    visit_date IS NULL
ORDER BY
    missing_date;