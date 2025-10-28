CREATE FUNCTION func_minimum(VARIADIC arr numeric[]) RETURNS numeric AS $$
		SELECT MIN(v) FROM UNNEST($1) AS v;
$$ LANGUAGE sql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);