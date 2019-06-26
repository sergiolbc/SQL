<!------------- Sergio Gonzalez SER2149064 ------------->

<?php
# Sergio's Video Store

#@ _DB_CONNECT_
  $dbh = new PDO("mysql:host=localhost;dbname=video_store", "root", "password");
#@ _DB_CONNECT_

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

# returns ALL rentals
$stmt = "SELECT rental_id, video_id, customer_id, checkout_date, due_date, return_date, fee_charge FROM rental";
$sth = $dbh->query ($stmt);

print ("<table>\n");          # begin table
# read results of statement, then clean up
#@ _ROW_PRINT_LOOP_
while ($row = $sth->fetch (PDO::FETCH_NUM))
{
  print ("<tr>\n");           # begin table row
  for ($i = 0; $i < $sth->columnCount (); $i++)
  {
    # escape any special characters and print table cell
    print ("<td>" . htmlspecialchars ($row[$i]) . "</td>\n");
  }
  print ("</tr>\n");          # end table row
}
#@ _ROW_PRINT_LOOP_
print ("</table>\n");         # end table

$dbh = NULL;  # close connection

print ("</body>\n");
print ("</html>\n");
?>
