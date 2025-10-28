SELECT address, pizzeria.name, COUNT(*) AS count_of_orders
FROM person JOIN person_order ON person.id=person_id
JOIN menu ON menu.id=menu_id
JOIN pizzeria ON pizzeria.id=pizzeria_id
GROUP BY address, pizzeria.name
ORDER BY 1, 2;