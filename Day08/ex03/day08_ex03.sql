--Session 1
BEGIN transaction isolation level READ COMMITTED;
--Session 2
BEGIN transaction isolation level READ COMMITTED;
--Session 1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
--Session 2
UPDATE pizzeria SET rating = 3.6::numeric WHERE name = 'Pizza Hut';
COMMIT;
--Session 1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;

--Session 1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
--Session 2
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';