WITH miss_dates AS (
    SELECT
        missing_date :: date
    FROM
        GENERATE_SERIES('2022-01-01', '2022-01-10', interval '1 day') AS missing_date
)
SELECT
    missing_date
FROM
    miss_dates
    LEFT JOIN person_visits pv ON miss_dates.missing_date = pv.visit_date
    AND (
        pv.person_id = 1
        OR pv.person_id = 2
    )
WHERE
    visit_date IS NULL
ORDER BY
    missing_date;