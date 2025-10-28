SELECT name, SUM(count) AS total_count FROM
((SELECT name, COUNT(*) AS count, 'visit' AS action_type
FROM person_visits JOIN pizzeria ON pizzeria_id=pizzeria.id
GROUP BY name)
UNION
(SELECT name, COUNT(*) AS count, 'order' AS action_type
FROM person_order JOIN menu ON menu.id=menu_id
JOIN pizzeria ON pizzeria_id=pizzeria.id
GROUP BY name))
GROUP BY name
ORDER BY 2 DESC, 1