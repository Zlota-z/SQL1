--Session 1
BEGIN transaction isolation level read committed;
--Session 2
BEGIN transaction isolation level read committed;
--Session 1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
--Session 2
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
--Session 1
UPDATE pizzeria SET rating = 4::numeric WHERE name = 'Pizza Hut';
--Session 2
UPDATE pizzeria SET rating = 3.6::numeric WHERE name = 'Pizza Hut';
--Session 1
COMMIT;
--Session 2
COMMIT;
--Session 1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
--Session 2
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
