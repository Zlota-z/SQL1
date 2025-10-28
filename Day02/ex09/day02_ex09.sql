WITH cte AS (SELECT person.name, pizza_name, person.gender
FROM person_order
JOIN menu ON menu.id = person_order.menu_id
JOIN person ON person.id=person_order.person_id
WHERE person.gender = 'female')

SELECT name FROM cte WHERE pizza_name = 'cheese pizza'
INTERSECT
SELECT name FROM cte WHERE pizza_name = 'pepperoni pizza'
ORDER BY 1;