CREATE UNIQUE INDEX idx_menu_unique
ON menu (pizzeria_id, pizza_name);

EXPLAIN ANALYZE
SELECT price
FROM menu
WHERE pizzeria_id = 6 AND pizza_name = 'cheese pizza';