<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  24th May,2011
	#	Test version  
	#	controller to process actions queued in the media_actions table and report status to the admin server
\*=========================================================================================*/

require_once("./lib/config.php");
require_once("./lib/classes/action-encoder.class.php");
require_once("./lib/classes/output.class.php");

// Initialise objects

	$mysqli = new mysqli($dbLogin['dbhost'], $dbLogin['dbusername'], $dbLogin['dbuserpass'], $dbLogin['dbname']);
	$dataObj = new Default_Model_Action_Class($mysqli);	
	$outObj = new Default_Model_Output_Class();

// Get the actions from the queue table

	$sqlQuery = "SELECT * FROM queue_commands AS cq, command_routes AS cr where cq.cq_command=cr.cr_action AND cq.cq_status = 'N' ORDER BY cq.cq_command";
//	echo $sqlQuery;
	$result = $mysqli->query($sqlQuery);
	if ($result->num_rows) {
	
// Process the outstanding actions 
		while(	$row = $result->fetch_object()) { 
			$function=$row->cr_function;
			$m_data[] = $dataObj->execAction( unserialize($row->cq_data), $row->cq_index, $function, time());					
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
 <form action="" method="post" enctype="application/x-www-form-urlencoded" name="action" id="action">
 
 <select name="action_select" onchange="javascript:submitform();">
 <option value="">Select action ...</option>
 <option value="execute">Execute items in queue</option>
 </select>
 
 </form>
 <?PHP // phpinfo(); ?>
</body>
</html>