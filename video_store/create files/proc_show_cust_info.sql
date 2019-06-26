# View movie info

DROP PROCEDURE if exists show_cust_info;

delimiter $
CREATE PROCEDURE show_cust_info(user_entry varchar(255))
	BEGIN
		SELECT customer_id, customer_name, customer_address, customer_city, customer_state, customer_postal, customer_number, customer_balance
        FROM customer
        WHERE user_entry LIKE customer_id OR user_entry LIKE customer_name OR user_entry LIKE customer_address OR user_entry LIKE customer_city OR user_entry LIKE customer_state OR user_entry LIKE customer_postal OR user_entry LIKE customer_number OR user_entry LIKE customer_balance;
        
        END$
delimiter ;
