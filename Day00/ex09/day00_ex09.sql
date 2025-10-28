SELECT (SELECT name From person WHERE person.id = pv.person_id) AS person_name,
        (SELECT name From pizzeria WHERE pizzeria.id = pv.pizzeria_id) AS pizzeria_name 
FROM (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09') AS pv 
ORDER BY 1 asc, 2 desc