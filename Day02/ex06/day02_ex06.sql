SELECT pizza_name, pizzeria.name AS pizzeria_name
FROM menu JOIN pizzeria ON pizzeria.id = pizzeria_id
JOIN person_order ON menu.id=menu_id
JOIN person ON person.id=person_id
WHERE person.name = 'Denis' OR person.name = 'Anna'
ORDER BY 1, 2;
