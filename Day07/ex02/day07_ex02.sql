(SELECT name, COUNT(*) AS count, 'visit' AS action_type
FROM person_visits JOIN pizzeria ON pizzeria_id=pizzeria.id
GROUP BY name
LIMIT 3)
UNION
(SELECT name, COUNT(*) AS count, 'order' AS action_type
FROM person_order JOIN menu ON menu.id=menu_id
JOIN pizzeria ON pizzeria_id=pizzeria.id
GROUP BY name
LIMIT 3)
ORDER BY 3, 2 DESC
