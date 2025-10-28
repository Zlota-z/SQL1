SELECT person.name, pizza_name, price,
  (price * (100 - discount)/100)::int AS discount_price,
  pizzeria.name AS pizzeria_name
FROM person_order
JOIN menu ON menu.id = menu_id
JOIN person ON person.id = person_id
JOIN person_discounts ON person.id = person_discounts.person_id AND person_discounts.pizzeria_id = menu.pizzeria_id 
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY 1,2