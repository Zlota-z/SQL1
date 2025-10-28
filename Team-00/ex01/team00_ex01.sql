SELECT DISTINCT t AS total_cost, tour
FROM (SELECT MIN(total_cost) AS t, p1 FROM v_all_costs WHERE p1 = 'a' GROUP BY p1
UNION
SELECT MAX(total_cost) AS t, p1 FROM v_all_costs WHERE p1 = 'a' GROUP BY p1) AS t1, v_all_costs
WHERE t1.t = v_all_costs.total_cost AND v_all_costs.p1 = 'a'
ORDER BY 1,2;