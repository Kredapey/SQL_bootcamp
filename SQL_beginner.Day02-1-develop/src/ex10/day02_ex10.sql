WITH p_name1 AS (
    SELECT
        id AS id1,
        name AS person_name1,
        address AS common_address
    FROM
        person
),
p_name2 AS (
    SELECT
        id AS id2,
        name AS person_name2,
        address AS common_address
    FROM
        person
)
SELECT
    person_name1,
    person_name2,
    common_address
FROM
    p_name1
    JOIN p_name2 USING(common_address)
WHERE
    person_name1 != person_name2
    AND id1 > id2
ORDER BY
    person_name1,
    person_name2,
    common_address;