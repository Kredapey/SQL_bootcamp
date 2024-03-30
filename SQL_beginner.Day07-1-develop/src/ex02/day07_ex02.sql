WITH orders AS (
    SELECT
        pizzeria.name AS name,
        COUNT(po.menu_id) AS count,
        'order' AS action_type
    FROM
        person_order po
        JOIN menu ON menu.id = po.menu_id
        JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    GROUP BY
        pizzeria.name
    ORDER BY
        count DESC
    LIMIT 3
),
visits AS (
    SELECT
        pizzeria.name AS name,
        COUNT(pv.pizzeria_id) AS count,
        'visit' AS action_type
    FROM
        person_visits pv
        JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
    GROUP BY
        pizzeria.name
    ORDER BY
        count DESC
    LIMIT 3
)
SELECT
    *
FROM
    orders
UNION
ALL
SELECT
    *
FROM
    visits
ORDER BY
    action_type;