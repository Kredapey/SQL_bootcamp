INSERT INTO
    person_order
VALUES
    (
        (
            SELECT
                MAX(id)
            FROM
                person_order
        ) + 1,
        (
            SELECT
                id
            FROM
                person
            WHERE
                name = 'Denis'
        ),
        20,
        '2022-02-24'
    ),
    (
        (
            SELECT
                MAX(id)
            FROM
                person_order
        ) + 2,
        (
            SELECT
                id
            FROM
                person
            WHERE
                name = 'Irina'
        ),
        20,
        '2022-02-24'
    );