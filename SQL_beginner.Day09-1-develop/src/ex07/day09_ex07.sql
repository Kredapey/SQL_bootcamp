CREATE OR REPLACE FUNCTION func_minimum(arr numeric ARRAY)
RETURNS numeric AS $$
    SELECT MIN(el) FROM UNNEST(arr) AS el;
$$ LANGUAGE sql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);