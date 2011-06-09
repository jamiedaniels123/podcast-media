<?php
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  20th Feb,2011
	#	Test version  
	#  Class File to handle file service actions and provide responses.
\*=========================================================================================*/

class Default_DB_Class
 {
	
	/**  * Constructor  */
	function Default_DB_Class($dbconnect, $dbLogin){}

// ------ User stuff


	function dbConnect(){
		
		global $dbconnect, $dbLogin;
		
		 if (!$dbconnect) $dbconnect = mysql_connect($dbLogin['dbhost'], $dbLogin['dbusername'], $dbLogin['dbuserpass']) or DIE(mysql_error());
		mysql_select_db($dbLogin['dbname'], $dbconnect);
		if (!$dbconnect) {
		  return 0;
		} else {
		  return $dbconnect;
		} 

	} 

}
?>