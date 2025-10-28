SELECT pizzeria_name FROM (
SELECT pizzeria.name AS pizzeria_name, COUNT(CASE WHEN gender= 'male' THEN 1 END) AS m_count, COUNT(CASE WHEN person.gender = 'female' THEN 1 END) AS f_count
FROM pizzeria
LEFT JOIN menu ON pizzeria.id = menu.pizzeria_id
LEFT JOIN person_order ON menu.id = person_order.menu_id
LEFT JOIN person ON person_order.person_id = person.id
WHERE gender is NOT NULL
GROUP BY 1
)
WHERE (m_count = 0 OR f_count = 0) AND (m_count != f_count)
ORDER BY 1;