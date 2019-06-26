SELECT president.first_name, president.last_name, president.birth, president.death, pres_term.term_start_date, pres_term.term_end_date, pres_term.reason_for_leaving_office 
FROM president
INNER JOIN pres_term ON president.death = pres_term.term_end_date;