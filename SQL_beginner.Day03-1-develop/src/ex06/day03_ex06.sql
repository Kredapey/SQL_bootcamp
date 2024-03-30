WITH ft AS (
    SELECT
        pizza_name,
        pizzeria.name AS pizzeria_name,
        price,
        menu.id AS id
    FROM
        menu
        JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
)
SELECT
    ft.pizza_name AS pizza_name,
    ft.pizzeria_name AS pizzeria_name_1,
    ft_s.pizzeria_name AS pizzeria_name_2,
    ft.price
FROM
    ft
    JOIN ft ft_s USING(pizza_name, price)
WHERE
    ft.pizzeria_name != ft_s.pizzeria_name
    AND ft.id > ft_s.id
ORDER BY
    pizza_name;