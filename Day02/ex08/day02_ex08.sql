SELECT person.name
FROM menu JOIN pizzeria ON pizzeria.id = pizzeria_id
JOIN person_order ON menu.id=menu_id
JOIN person ON person.id=person_id
WHERE (person.address = 'Moscow' OR person.address = 'Samara') AND person.gender = 'male'
AND (pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza')
ORDER BY 1 DESC;