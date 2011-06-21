<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  24th May,2011
	#	Test version  
	#	controller to process actions queued in the media_actions table and report status to the admin server
\*=========================================================================================*/

require_once("./lib/config.php");
require_once("./lib/classes/action-admin.class.php");
require_once("./lib/classes/output.class.php");

// Initialise objects

	$mysqli = new mysqli($dbLogin['dbhost'], $dbLogin['dbusername'], $dbLogin['dbuserpass'], $dbLogin['dbname']);
	$dataObj = new Default_Model_Action_Class($mysqli);	
	$outObj = new Default_Model_Output_Class();

// Get the actions from the queue table

	$sqlQuery0 = "SELECT * FROM queue_messages AS mq, command_routes AS cr, api_destinations AS ad WHERE cr.cr_action=mq.mq_command AND cr.cr_source=ad.ad_name AND mq.mq_status = 'N' ORDER BY mq.time_start";
//	echo $sqlQuery;
	$result0 = $mysqli->query($sqlQuery0);
	if ($result0->num_rows) {
	
// Process the outstanding commands for each message
		while(	$row0 = $result0->fetch_object()) { 
			$m_data[] = $dataObj->directAction($row0->mq_command, $row0->mq_index);	
			$sqlQuery1 = "SELECT * FROM queue_messages AS mq, queue_commands cq WHERE mq.mq_index=mq.cq_mq_index AND mq.mq_index = '".$row0->mq_index."' AND cq.cq_status='N' ";
			$result1 = $mysqli->query($sqlQuery1);
			if ($result1->num_rows==0) {
				$sqlQuery2 = "UPDATE `queue_messages` SET `mq_update` = '".date("Y-m-d H:i:s", $timestamp)."' ,`mq_status`= 'Y' where mq_index='".$row0->mq_index."' ";
				$result2 = $mysqli->query($sqlQuery2);
				$sqlQuery3 = "SELECT * FROM queue_messages AS mq, queue_commands cq WHERE mq.mq_index=mq.cq_mq_index AND mq.mq_index = '".$row0->mq_index."'";
				$result3 = $mysqli->query($sqlQuery3);
				$i=1;
				while(	$row3 = $result3->fetch_object()){
					$r_data[]= unserialize($row3->cq_result); 
					$i++;
				}
				
				$result=$outObj->message_send($row0->cr_callback, $row0->ad_url, serialize($r_data), $i);
				
			}
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
<br /><?PHP if (isset($result)) print_r($result);?><br /><br /> 
<br /><?PHP if (isset($r_data)) print_r($r_data);?><br /><br /> 
 <form action="" method="post" enctype="application/x-www-form-urlencoded" name="action" id="action">
 
 <select name="action_select" onchange="javascript:submitform();">
 <option value="">Select action ...</option>
 <option value="execute">Execute items in admin queue</option>
 </select>
 
 </form>
 <?PHP // phpinfo(); ?>
</body>
</html>