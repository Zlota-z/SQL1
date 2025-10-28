--Session 1
BEGIN transaction isolation level repeatable read;
--Session 2
BEGIN transaction isolation level repeatable read;
--Session 1
UPDATE pizzeria SET rating = 1::numeric WHERE id = 1;
--Session 2
UPDATE pizzeria SET rating = 2::numeric WHERE id = 2;
--Session 1
UPDATE pizzeria SET rating = 3::numeric WHERE id = 2;
--Session 2
UPDATE pizzeria SET rating = 4::numeric WHERE id = 1;
--Session 1
COMMIT;
--Session 2
COMMIT;
