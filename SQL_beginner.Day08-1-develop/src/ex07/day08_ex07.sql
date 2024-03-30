-- SESSION 1
BEGIN;

-- SESSION 2
BEGIN;

-- SESSION 1
UPDATE pizzeria SET rating = 3 WHERE name = 'Pizza Hut';

-- SESSION 2
UPDATE pizzeria SET rating = 5 WHERE name = 'DoDo Pizza';

-- SESSION 1
UPDATE pizzeria SET rating = 4 WHERE name = 'DoDo Pizza';

-- SESSION 2
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';

-- SESSION 1
COMMIT;

-- SESSION 2
COMMIT;