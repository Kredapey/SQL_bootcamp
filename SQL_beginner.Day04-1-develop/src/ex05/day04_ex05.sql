CREATE VIEW v_price_with_discount AS
SELECT
    person.name AS name,
    menu.pizza_name AS pizza_name,
    menu.price AS price,
    ROUND(menu.price - (menu.price * 0.1)) AS discount_price
FROM
    person_order po
    JOIN menu ON menu.id = po.menu_id
    JOIN person ON po.person_id = person.id
ORDER BY
    name,
    pizza_name;