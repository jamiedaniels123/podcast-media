<?
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  25th May,2011
	#	Test version  
/*========================================================================================*/

//___Debug_________________________________________________________________________________________//

//	ini_set(display_errors,On);

//___DB CONNECTION_________________________________________________________________________________//

//		$HOSTNAME = "localhost";		// DB server name
//		$DATABASE = "mediaserver";				// DB name
//		$USERNAME = "admin";				// DB user login name
//		$PASSWORD = "g833nf80g";		// DB password

//___DB SCRIPT_____________________________________________________________________________________//

//		$db_connect = mysql_connect($HOSTNAME, $USERNAME, $PASSWORD) or DIE(mysql_error());
//		mysql_select_db($DATABASE, $db_connect);
//_________________________________________________________________________________________________//
		

//		$adminUrl="http://podcast-admin-dev.open.ac.uk/";
		$adminUrl="http://localhost/admin.php";
		$mediaUrl="http://localhost/";

//		define ('FILE_ROOT', "/......."); 		
		$FILE_ROOT = "/vhosts/httpdocs";
		$pageURL = 'http';
//		if ($_SERVER["HTTPS"] == "on") {$pageURL .= "s";} 
		$pageURL .= "://";
		if ($_SERVER["SERVER_PORT"] != "80") {
			$pageURL .= $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"].$_SERVER["REQUEST_URI"];
		} else {
			$pageURL .= $_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
		}
		$page_urlArr = explode('&pn=',$pageURL);
		$page_url = $page_urlArr[0];
		$rootdir = "$FILE_ROOT/aw_root";
		$ADMIN_ROOT = "$FILE_ROOT/admin";
		$list_length = 30; // Adjusts all paged lists rows per page
		$PATH_ADMIN				= "$ADMIN_ROOT/";
		$PATH_ADMIN_INCLUDES 	= "$ADMIN_ROOT/includes/";
			
		$EMAIL_FROM_NAME		= "admin";
		$EMAIL_FROM_ADDR		= "info@this.com";

//___Session_init__________________________________________________________________________________//

		
		define ('TIME_OFFSET', "3600"); // Summer time offset
		$base_url = "http://".$_SERVER['HTTP_HOST']."/";
//		$logoutPlace = "http://".$_SERVER['HTTP_HOST']."?logout=1&timeout=1";
		$msg = "";
/*		if (isset($_REQUEST['logout'])){
			unset($login);
			session_unregister("id_user");
			session_unregister("org_id");
			session_unregister("set");
			$page = "home";
			if (isset($_REQUEST['timeout']) && $_REQUEST['timeout']==1) $msg= "Inactivity logout - 600 mins";
		}
		if (isset($_REQUEST['login'])){
			$page = "home";
		}
		if (!isset($styleNo)) $styleNo = NULL;	
*/
?>