WITH m_id AS (
    SELECT
        id AS menu_id
    FROM
        menu
    EXCEPT
    SELECT
        menu_id
    FROM
        person_order
    ORDER BY
        menu_id
)
SELECT
    menu.pizza_name AS pizza_name,
    menu.price AS price,
    pizzeria.name AS pizzeria_name
FROM
    m_id
    JOIN menu ON m_id.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY
    pizza_name,
    price;