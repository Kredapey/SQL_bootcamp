CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson varchar DEFAULT 'Dmitriy',
    IN pprice numeric DEFAULT 500,
    IN pdate date DEFAULT '2022-01-08'
) RETURNS TABLE(pizzeria_name varchar) AS $$ 
BEGIN 
RETURN QUERY (
    (
        SELECT
            pizzeria.name AS pizzeria_name
        FROM
            person_visits pv
            JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
            JOIN menu ON menu.pizzeria_id = pizzeria.id
            JOIN person ON person.id = pv.person_id
        WHERE
            person.name = pperson
            AND menu.price < pprice
            AND pv.visit_date = pdate
    )
    INTERSECT
    (
        SELECT
            pizzeria.name AS pizzeria_name
        FROM
            person_order po
            JOIN menu ON menu.pizzeria_id = po.id
            JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
            JOIN person ON person.id = po.person_id
        WHERE
            person.name = pperson
            AND menu.price < pprice
            AND po.order_date = pdate
    )
);
END;
$$ LANGUAGE plpgsql;

-- select
--     *
-- from
--     fnc_person_visits_and_eats_on_date(
--         pperson := 'Anna',
--         pprice := 1300,
--         pdate := '2022-01-01'
--     );

-- select *
-- from fnc_person_visits_and_eats_on_date(pprice := 800);
