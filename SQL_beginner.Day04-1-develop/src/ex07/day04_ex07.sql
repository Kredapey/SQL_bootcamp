INSERT INTO
    person_visits
VALUES
    (
        (
            SELECT
                MAX(id) + 1
            FROM
                person_visits
        ),
        (
            SELECT
                id
            FROM
                person
            WHERE
                name = 'Dmitriy'
        ),
        (
            SELECT
                pizzeria.id
            FROM
                pizzeria
                JOIN menu ON menu.pizzeria_id = pizzeria.id
            WHERE
                pizzeria.name NOT IN (
                    SELECT
                        *
                    FROM
                        mv_dmitriy_visits_and_eats
                )
                AND menu.price < 800
            ORDER BY
                RANDOM()
            LIMIT
                1
        ), '2022-01-08'
    );

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;