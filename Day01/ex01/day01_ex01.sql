SELECT name FROM 
(SELECT name FROM person ORDER BY 1)
UNION ALL SELECT pizza_name AS object_name FROM
(SELECT pizza_name FROM menu ORDER BY 1)