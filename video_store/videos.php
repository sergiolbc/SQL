<!------------- Sergio Gonzalez SER2149064 ------------->

<?php
# Sergio's Video Store

#@ _DB_CONNECT_
  $dbh = new PDO("mysql:host=localhost;dbname=video_store", "root", "password");
#@ _DB_CONNECT_

# CREATE PROCEDURE show_mov_info
delimiter $
CREATE PROCEDURE show_mov_info(user_entry varchar(255))
	BEGIN
		SELECT video_id, video_rented, video_name, video_genre, video_release_date, video_director
        FROM video
        WHERE user_entry LIKE video_id OR user_entry LIKE video_rented OR user_entry LIKE video_name OR user_entry LIKE video_genre OR user_entry LIKE video_release_date OR user_entry LIKE video_director;
        
    END$
delimiter ;
# CREATE PROCEDURE show_mov_info

$title = "Video Search";
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
$user_entry = $_REQUEST['video_txt'];

CALL show_mov_info($user_entry);

$dbh = NULL;  # close connection

print ("</body>\n");
print ("</html>\n");
?>