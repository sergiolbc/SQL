<!------------- Sergio Gonzalez SER2149064 ------------->

<html>
<head>
<title>Sergio's Video Store</title>
</head>
<body bgcolor="white">
<h2>Sergio's Video Store</h2>
<p>Hello! Search through the 3 options.</p>
<?php
# Video Store home page

try
{
#@ _DB_CONNECT_
  $dbh = new PDO("mysql:host=localhost;dbname=video_store", "root", "password");
#@ _DB_CONNECT_
#@ _ENABLE_EXCEPTIONS_
  $dbh->setAttribute (PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
#@ _ENABLE_EXCEPTIONS_

print ("
<p>
You can view the rental checkouts <a href=\"rentals.php\">here</a>.
</p>

<p>
<form action = \"customers.php\" method = \"get\">
Search through Customers:
<input type = \"text\" name = \"customer_txt\">
</form>

<form action = \"videos.php\" method = \"get\">
Search through Videos:
<input type = \"text\" name = \"video_txt\">
</form>
</p> ");


#@ _PROCESS_QUERY_
#  $sth = $dbh->query ("SELECT COUNT(*) FROM member");
#  $count = $sth->fetchColumn (0);
#  print ("<p>The League currently has $count members.</p>");
#@ _PROCESS_QUERY_
  $dbh = NULL;  # close connection
}
catch (PDOException $e) { } # empty handler (catch but ignore errors)
?>
</body>
</html>
