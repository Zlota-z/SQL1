insert into menu (id, pizzeria_id, pizza_name, price)
values (((SELECT MAX(menu.id) FROM menu) + 1), (SELECT pizzeria.id FROM pizzeria WHERE pizzeria.name = 'Dominos'), 'sicilian pizza', 900);