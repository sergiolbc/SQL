delimiter $
CREATE FUNCTION count_over_age(p_year INT)
	RETURNS INT
    READS SQL data
BEGIN
	RETURN (SELECT COUNT(*) FROM pres_age WHERE pres_age.age > p_year);
	END$
delimiter ;
