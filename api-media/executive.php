<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  24th May,2011
	#	Test version  
	#	controller to process actions queued in the media_actions table and report status to the admin server
\*=========================================================================================*/

require_once("./lib/config.php");
require_once("./lib/classes/action-media.class.php");

// Initialise objects

	$mysqli = new mysqli($dbLogin['dbhost'], $dbLogin['dbusername'], $dbLogin['dbuserpass'], $dbLogin['dbname']);

	$dataObj = new Default_Model_Action_Class($mysqli);	

// Get the actions from the queue table

	$sqlQuery0 = "SELECT * FROM queue_commands AS cq, command_routes AS cr WHERE cr.cr_action=cq.cq_command AND cq.cq_status = 'N' ORDER BY cq.cq_time";
//	echo $sqlQuery0;
	$result0 = $mysqli->query($sqlQuery0);
	if (isset($result0->num_rows)) {
	
// Process the outstanding commands for each message
		while(	$row0 = $result0->fetch_object()) { 
			$m_data= $dataObj->doQueueAction($row0->cr_function, unserialize($row0->cq_data), $row0->cq_index);	
		}
	}

// Report the status of completed tasks

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admin post command</title>
<script type="application/x-javascript">
<!--
function submitform()
{
	document.getElementById('action').submit();
}
-->
</script>
</head>

<body>
<br /><?PHP if (isset($m_data)) print_r($m_data);?><br /><br /> 
<br /><?PHP if (isset($error)) print_r($error);?><br /><br /> 
 <form action="" method="post" enctype="application/x-www-form-urlencoded" name="action" id="action">
 
 <select name="action_select" onchange="javascript:submitform();">
 <option value="">Select action ...</option>
 <option value="execute">Execute items in admin queue</option>
 </select>
 
 </form>
 <?PHP // phpinfo(); ?>
</body>
</html>
