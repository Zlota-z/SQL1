SELECT COALESCE(person.name, '-') AS person_name, person_visits.visit_date, COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM person LEFT JOIN person_visits ON person.id=person_visits.person_id AND person_visits.visit_date BETWEEN '2022-01-01' AND '2022-01-03'
FULL JOIN pizzeria ON pizzeria.id=person_visits.pizzeria_id AND person_visits.visit_date BETWEEN '2022-01-01' AND '2022-01-03'
ORDER BY 1, 2, 3;