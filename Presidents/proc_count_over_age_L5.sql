delimiter $
CREATE PROCEDURE show_over_age(p_year INT)
	BEGIN
		SELECT first_name, last_name, birth, death, age
        FROM pres_age
        WHERE age > p_year;
        END$
delimiter ;