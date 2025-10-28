--Session 1
BEGIN transaction isolation level READ COMMITTED;
--Session 2
BEGIN transaction isolation level READ COMMITTED;
--Session 1
SELECT SUM(rating) FROM pizzeria;
--Session 2
INSERT INTO pizzeria values (10,'Kazan Pizza', 5);
COMMIT;
--Session 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;

--Session 1
SELECT SUM(rating) FROM pizzeria;
--Session 2
SELECT SUM(rating) FROM pizzeria;