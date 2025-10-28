SELECT address, ROUND(MAX(age)-(MIN(age)::numeric/MAX(age)), 2)::float AS formula, ROUND(AVG(age), 2)::float AS average,
ROUND(MAX(age)-(MIN(age)::numeric/MAX(age)), 2)::float>ROUND(AVG(age), 2)::float AS comparison
FROM person
GROUP BY address
ORDER BY 1;
