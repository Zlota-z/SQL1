WITH cte AS(
SELECT id, name, address FROM person
)

SELECT person.name AS person_name1, cte.name AS person_name2, person.address AS common_address
FROM person CROSS JOIN cte
WHERE cte.address = person.address AND cte.id < person.id

ORDER BY 1, 2, 3;