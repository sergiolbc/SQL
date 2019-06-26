<!------------- Sergio Gonzalez SER2149064 ------------->

<?php
# Sergio's Video Store

#@ _DB_CONNECT_
  $dbh = new PDO("mysql:host=localhost;dbname=video_store", "root", "password");
#@ _DB_CONNECT_

# CREATE PROCEDURE show_cust_info
delimiter $
CREATE PROCEDURE show_cust_info(user_entry varchar(255))
	BEGIN
		SELECT customer_id, customer_name, customer_address, customer_city, customer_state, customer_postal, customer_number, customer_balance
        FROM customer
        WHERE user_entry LIKE customer_id OR user_entry LIKE customer_name OR user_entry LIKE customer_address OR user_entry LIKE customer_city OR user_entry LIKE customer_state OR user_entry LIKE customer_postal OR user_entry LIKE customer_number OR user_entry LIKE customer_balance;
        
        END$
delimiter ;
# CREATE PROCEDURE show_cust_info


$title = "Customer Search";
html_begin ($title, $title);
print ("<html>\n");
  print ("<head>\n");
  if ($title != "")
    print ("<title>$title</title>\n");
  print ("</head>\n");
  print ("<body bgcolor=\"white\">\n");
  if ($header != "")
    print ("<h2>$header</h2>\n");

# return the customers
$user_entry = $_REQUEST['customer_txt'];

CALL show_cust_info($user_entry);

$dbh = NULL;  # close connection

print ("</body>\n");
print ("</html>\n");
?>
