CREATE OR REPLACE FUNCTION fnc_fibonacci(max_num integer DEFAULT 10) RETURNS TABLE(fibonacci_number integer) AS $$
WITH RECURSIVE temp AS  (
SELECT 
	0 AS p1,
	1 AS p2,
	0 AS total
UNION ALL
SELECT temp.p2 AS p1,
	temp.total AS p2,
	temp.p2 + temp.total AS total
FROM
	temp
WHERE total < max_num
)
SELECT total FROM temp WHERE total < max_num;
$$ LANGUAGE sql;

-- select * from fnc_fibonacci(100);

-- select * from fnc_fibonacci();