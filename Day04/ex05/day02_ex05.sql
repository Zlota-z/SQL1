CREATE VIEW v_price_with_discount AS
SELECT name, pizza_name, price, (price - price*0.1)::int AS discount_price
FROM person_order JOIN person ON person.id=person_id JOIN menu ON menu_id=menu.id
ORDER BY 1, 2;