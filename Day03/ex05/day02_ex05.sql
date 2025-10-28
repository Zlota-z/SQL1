SELECT pizzeria_name FROM (
SELECT DISTINCT pizzeria.name AS pizzeria_name, person.name,
COUNT(DISTINCT person_order.id) AS po,
COUNT(DISTINCT person_visits.id) AS pv
FROM pizzeria
FULL JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
FULL JOIN person ON person_visits.person_id = person.id
FULL JOIN menu ON pizzeria.id = menu.pizzeria_id
FULL JOIN person_order ON person.id = person_order.person_id AND menu.id = person_order.menu_id
GROUP BY 1, 2
)
WHERE name = 'Andrey' AND po = 0 AND pv > 0
ORDER BY 1;