CREATE FUNCTION fnc_person_visits_and_eats_on_date
	(pperson varchar default 'Dmitriy',
	pprice numeric default 500,
	pdate date default '2022-01-08') RETURNS SETOF varchar AS $$
	BEGIN
		RETURN QUERY SELECT DISTINCT pizzeria.name
		FROM pizzeria JOIN person_visits ON pizzeria.id=pizzeria_id
		JOIN person ON person.id = person_id
		JOIN menu ON pizzeria.id=menu.pizzeria_id
		WHERE pperson = person.name AND pprice > price AND pdate = visit_date;
	END;
$$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');