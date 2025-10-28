CREATE INDEX idx_person_name ON person(upper(name));
EXPLAIN ANALYZE
SELECT pizza_name, person.name AS person_name
FROM menu JOIN person_order ON person_order.menu_id=menu.id
JOIN person ON person.id=person_order.person_id
WHERE person.name='Denis'