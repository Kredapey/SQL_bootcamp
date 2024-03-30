-- SESSION 1
BEGIN;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SHOW TRANSACTION ISOLATION LEVEL;

-- SESSION 2
BEGIN;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SHOW TRANSACTION ISOLATION LEVEL;

-- SESSION 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION 1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

-- SESSION 2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

-- SESSION 1
COMMIT;

-- SESSION 2
COMMIT;

-- SESSION 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';