WITH my_table AS (
    SELECT
        person.name AS name,
        menu.pizza_name AS pizza_name
    FROM
        person_order
        JOIN person ON person_order.person_id = person.id
        AND person.gender = 'female'
        JOIN menu ON person_order.menu_id = menu.id
        AND (
            menu.pizza_name IN ('pepperoni pizza', 'cheese pizza')
        )
)
SELECT
    name
FROM
    my_table
GROUP BY
    name
HAVING
    COUNT(*) = 2
ORDER BY
    name;