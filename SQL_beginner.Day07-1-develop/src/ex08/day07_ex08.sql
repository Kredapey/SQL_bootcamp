SELECT
    person.address AS address,
    pizzeria.name AS name,
    COUNT(pizzeria.name) AS count_of_orders
FROM
    person_order po
    JOIN person ON person.id = po.person_id
    JOIN menu ON po.menu_id = menu.id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY
    person.address,
    pizzeria.name
ORDER BY
    address,
    name;