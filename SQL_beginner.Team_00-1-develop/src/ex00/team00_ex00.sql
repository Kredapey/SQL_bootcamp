CREATE TABLE IF NOT EXISTS routes (
  point1 varchar NOT NULL,
  point2 varchar NOT NULL,
  cost bigint NOT NULL,
  UNIQUE(point1, point2)
);

INSERT INTO
  routes
VALUES
  ('A', 'B', 10),
  ('B', 'A', 10),
  ('A', 'C', 15),
  ('C', 'A', 15),
  ('A', 'D', 20),
  ('D', 'A', 20),
  ('B', 'C', 35),
  ('C', 'B', 35),
  ('B', 'D', 25),
  ('D', 'B', 25),
  ('C', 'D', 30),
  ('D', 'C', 30);

WITH RECURSIVE cte_routes AS (
  SELECT
    point1 AS common_route,
    point1 AS start_point,
    point2 AS end_point,
    cost AS sum_cost,
    1 AS counter_points
  FROM
    routes
  WHERE
    point1 = 'A'
  UNION
  ALL
  SELECT
    cte.common_route || ',' || cte.end_point AS common_route,
    r.point1 AS start_point,
    r.point2 AS end_point,
    cte.sum_cost + r.cost AS sum_cost,
    cte.counter_points + 1 AS counter_points
  FROM
    routes r
    JOIN cte_routes cte ON r.point1 = cte.end_point
  WHERE
    common_route NOT LIKE '%' || cte.end_point || '%'
),
full_routes AS (
  SELECT
    sum_cost AS total_cost,
    common_route || ',' || end_point AS tour
  FROM
    cte_routes
  WHERE
    counter_points = 4
    AND end_point = 'A'
)
SELECT
  *
FROM
  full_routes
WHERE
  total_cost IN (
    SELECT
      MIN(total_cost)
    FROM
      full_routes
  )
ORDER BY
  total_cost,
  tour;