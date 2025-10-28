CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name
FROM person_visits JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
JOIN person ON person.id=person_id
JOIN menu ON menu.pizzeria_id = pizzeria.id
WHERE person.name = 'Dmitriy' AND visit_date = '2022-01-08' AND price < 800;