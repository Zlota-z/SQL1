insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH cu_dates AS (
    SELECT
        b.user_id,
        b.currency_id,
        b.updated AS balance_updated,
        COALESCE(
            (SELECT cu.updated
             FROM currency cu
             WHERE b.updated >= cu.updated AND b.currency_id = cu.id
             ORDER BY cu.updated DESC
             LIMIT 1),
            (SELECT cu.updated
             FROM currency cu
             WHERE b.updated <= cu.updated AND b.currency_id = cu.id
             ORDER BY cu.updated
             LIMIT 1)
        ) AS cu_date
    FROM balance b
)
SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    cu.name AS currency_name,
    cu.rate_to_usd * b.money AS currency_in_usd
FROM
    "user" u
FULL JOIN
    balance b ON b.user_id = u.id
JOIN
    cu_dates cd ON b.user_id = cd.user_id
                AND b.currency_id = cd.currency_id
                AND b.updated = cd.balance_updated
JOIN
    currency cu ON cu.id = b.currency_id
                AND cu.updated = cd.cu_date
WHERE
    cu.name IS NOT NULL
ORDER BY
    (CASE WHEN u.name IS NOT NULL THEN 0 ELSE 1 END),
    name DESC,
    (CASE WHEN u.lastname IS NOT NULL THEN 0 ELSE 1 END),
    lastname ASC,
    currency_name ASC;
