SELECT
    menu.pizza_name AS pizza_name,
    pizzeria.name AS pizzeria_name
FROM
    person_order
    JOIN menu ON menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person ON person_id = person.id
    AND (
        person.id = 1
        OR person.id = 4
    )
ORDER BY
    pizza_name,
    pizzeria_name;