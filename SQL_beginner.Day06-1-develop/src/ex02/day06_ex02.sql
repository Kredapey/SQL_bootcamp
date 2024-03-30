SELECT
    person.name AS name,
    menu.pizza_name AS pizza_name,
    menu.price AS price,
    ROUND(menu.price - (menu.price * (pd.discount / 100))) AS discount_price,
    pizzeria.name AS pizzeria_name
FROM
    person_order po
    JOIN menu ON menu.id = po.menu_id
    JOIN person ON person.id = po.person_id
    JOIN person_discounts pd ON pd.person_id = po.person_id
    AND pd.pizzeria_id = menu.pizzeria_id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY
    name,
    pizza_name;