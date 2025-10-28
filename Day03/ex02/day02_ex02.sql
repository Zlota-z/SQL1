SELECT pizza_name, price, pizzeria.name AS pizzeria_name
FROM menu LEFT JOIN person_order ON menu_id=menu.id
JOIN pizzeria ON menu.pizzeria_id=pizzeria.id
WHERE order_date is NULL
ORDER BY 1, 2;