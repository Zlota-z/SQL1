--Session 1
BEGIN;
UPDATE pizzeria SET rating = 5::numeric WHERE name = 'Pizza Hut';
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

--Session 2
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

--Session 1
COMMIT;

--Session 2
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';