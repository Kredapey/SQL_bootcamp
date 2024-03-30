SELECT
    address,
    ROUND(
        MAX(CAST(age AS numeric)) - (
            MIN(CAST(age AS numeric)) / MAX(CAST(age AS numeric))
        ),
        2
    ) AS formula,
    ROUND(AVG(CAST(age AS numeric)), 2) AS average,
    CASE
        WHEN (
            MAX(CAST(age AS numeric)) - (
                MIN(CAST(age AS numeric)) / MAX(CAST(age AS numeric))
            )
        ) > AVG(CAST(age AS numeric)) THEN true
        ELSE false
    END AS comparison
FROM
    person
GROUP BY
    address
ORDER BY
    address;