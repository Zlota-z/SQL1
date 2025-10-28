DROP TABLE IF EXISTS graph CASCADE;

CREATE TABLE IF NOT EXISTS graph
(
	id    SERIAL PRIMARY KEY,
	point1 TEXT NOT NULL,
	point2 TEXT NOT NULL,
	cost   INT NOT NULL
);

INSERT INTO graph (point1, point2, cost)
VALUES
		('a', 'b', 10),
		('b', 'a', 10),
		('a', 'c', 15),
		('c', 'a', 15),
		('a', 'd', 20),
		('d', 'a', 20),
		('b', 'c', 35),
		('c', 'b', 35),
		('b', 'd', 25),
		('d', 'b', 25),
		('c', 'd', 30),
		('d', 'c', 30)
;


-- RECURSIVE SOLUTION

CREATE OR REPLACE VIEW v_all_tours_recursive AS 
    WITH RECURSIVE tour (path, last_point, visited, total_cost) AS (
        SELECT 
            '{a}'::TEXT[] AS path,
            'a' AS last_point,
            '{a}'::TEXT[] AS visited,
            0 AS total_cost
        UNION ALL
        
        SELECT
            ARRAY_APPEND(path, point2),
            point2,
            ARRAY_APPEND(visited, point2),
            total_cost + cost
        FROM
            tour
        JOIN
            graph ON tour.last_point = graph.point1
        WHERE
            NOT point2 = ANY(visited)
    )

    SELECT 
        total_cost + g.cost AS total_cost,
        '{' ||
            ARRAY_TO_STRING(
                ARRAY_APPEND(path, 'a'), ','
            )
        || '}' AS tour
    FROM
        tour
    JOIN 
        graph g ON tour.last_point = g.point1 AND g.point2 = 'a'
    WHERE 
        array_length(visited, 1) = 4
    ORDER BY 
        total_cost, tour;

SELECT * FROM v_all_tours_recursive
WHERE total_cost = (
        SELECT MIN(total_cost) FROM v_all_tours_recursive
    );
    

-- NON-RECURSIVE SOLUTION

CREATE OR REPLACE VIEW v_all_costs AS
SELECT DISTINCT graph.point1 AS p1, g2.point1 AS p2, g3.point1 AS p3, g4.point1 AS p4, fin.point1 AS fin,
graph.cost+g2.cost+g3.cost+g4.cost AS total_cost,
CONCAT('{', graph.point1, ',', g2.point1, ',', g3.point1, ',', g4.point1, ',', fin.point1, '}') AS tour
FROM graph
JOIN graph g2 ON graph.point2 = g2.point1
JOIN graph g3 ON g2.point2 = g3.point1 AND g2.point2 != graph.point1
JOIN graph g4 ON g3.point2 = g4.point1 AND g4.point1 != graph.point1 AND g4.point1 != g2.point1
JOIN graph fin ON g4.point2 = fin.point1 AND fin.point1 = graph.point1
ORDER BY 1,2,3,4,5,6;

SELECT DISTINCT t AS total_cost, tour
FROM (SELECT MIN(total_cost) AS t, p1 FROM v_all_costs WHERE p1 = 'a' GROUP BY p1) AS t1, v_all_costs
WHERE t1.t = v_all_costs.total_cost AND v_all_costs.p1 = 'a'
ORDER BY 1,2;
