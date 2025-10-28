CREATE FUNCTION fnc_fibonacci(pstop int DEFAULT 10) RETURNS SETOF int AS $$
DECLARE
    f_val INT;
BEGIN
    FOR f_val IN
       WITH RECURSIVE fibo_alg AS (
            SELECT 0 AS f1, 1 AS f2
            UNION ALL
            SELECT f2, f1 + f2
            FROM fibo_alg
            WHERE f1 < pstop
        )
        SELECT f1
        FROM fibo_alg
     	WHERE f1 < pstop
    LOOP
        RETURN NEXT f_val;
    END LOOP;
    RETURN;
END;
$$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();