select name from
(select * from v_persons_female
UNION ALL
select * from v_persons_male)
order by 1;