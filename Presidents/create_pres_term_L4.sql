CREATE TABLE pres_term
(
	pres_id int,
    term_start_date date,
    term_end_date date, 
    number_of_elections_won int,
    reason_for_leaving_office varchar(255),
    term_id int AUTO_INCREMENT,
    KEY term_id (term_id)
    
);

