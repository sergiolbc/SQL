DROP VIEW IF EXISTS pres_age_in_office;
CREATE VIEW pres_age_in_office AS
SELECT president.pres_id, president.first_name, president.last_name, president.birth, pres_term.term_start_date,
TIMESTAMPDIFF(YEAR, birth, death) AS age
FROM president
INNER JOIN pres_term ON president.pres_id = pres_term.pres_id;