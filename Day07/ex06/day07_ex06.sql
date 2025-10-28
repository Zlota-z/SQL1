SELECT name, count(*), ROUND(AVG(price), 2)::float AS average_price, MAX(price) AS max_price, MIN(price) AS min_price
FROM pizzeria JOIN menu ON pizzeria.id=pizzeria_id
JOIN person_order ON menu.id=menu_id
GROUP BY name
ORDER BY 1;