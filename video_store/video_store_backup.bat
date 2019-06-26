REM mySQLbackup.bat first parameter is the database name
REM * backup the mySQL database, username is bkupUser
REM *
REM * The PATH is the location of the mySQL utility programs, mysqldump in this case.
PATH ;
PATH c:\Program Files\mySQL\MySQL Server 8.0\bin
REM
REM below the filename will be in the format %1_backupYYYYMMDD, every file will be unique
REM mysqldump --user=root--password=password --resultfile="c:\usr\local\Backups\%1_backup%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%.sql" %1
REM *
REM modify this .bat file if you prefer the file name to be in the forma %1_backupWEEKDAY.sql, like sampdb_backupTHU.sql
REM It works great for weekly backups, overwriting each day as the backups run
mysqldump --user=root --password=password --result-file="c:\usr\local\Backups\%1_backup%DATE:~0,3%.sql" %1
REM *