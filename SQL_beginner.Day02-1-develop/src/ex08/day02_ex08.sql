SELECT
    name
FROM
    person
    JOIN person_order ON person_order.person_id = person.id
    JOIN menu ON person_order.menu_id = menu.id
    AND (
        menu.pizza_name IN ('mushroom pizza', 'pepperoni pizza')
    )
WHERE
    person.address IN ('Moscow', 'Samara')
    AND person.gender = 'male'
ORDER BY
    name DESC;