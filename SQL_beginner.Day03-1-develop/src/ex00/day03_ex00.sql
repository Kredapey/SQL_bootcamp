SELECT
    menu.pizza_name AS pizza_name,
    menu.price AS price,
    pizzeria.name AS pizzeria_name,
    visit_date
FROM
    person_visits
    JOIN menu ON person_visits.pizzeria_id = menu.pizzeria_id
    AND (
        menu.price BETWEEN 800
        AND 1000
    )
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person ON person_visits.person_id = person.id
    AND person.id = 3
ORDER BY
    pizza_name,
    price,
    pizzeria_name;