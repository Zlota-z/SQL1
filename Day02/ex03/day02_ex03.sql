WITH cte AS (  
SELECT generate_series('2022-01-01'::date,'2022-01-10', '1 day') AS date)
SELECT date::date as missing_date
FROM cte LEFT JOIN person_visits ON (person_visits.visit_date = date AND (person_visits.person_id = 1 OR person_visits.person_id = 2))
WHERE person_visits.visit_date is NULL
ORDER BY 1;
