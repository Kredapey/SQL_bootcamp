SELECT
    pizzeria.name AS pizzeria_name
FROM
    pizzeria
    JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    AND person_visits.visit_date = '2022-01-08'
    JOIN person ON person_visits.person_id = person.id
    AND person.name = 'Dmitriy'
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    AND menu.price < 800;