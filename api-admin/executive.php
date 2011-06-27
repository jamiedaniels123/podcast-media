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
	$outObj = new Default_Model_Output_Class();
	$dataObj = new Default_Model_Action_Class($mysqli,$outObj,$apiName);	


// Poll for any completed or failed commands on Media and Encoder queues

	$sqlQuery = "SELECT ad.ad_url FROM api_destinations AS ad WHERE ad.ad_name = 'media-api'";
//	echo $sqlQuery0;
	$result = $mysqli->query($sqlQuery);
	$row = $result->fetch_object();
// echo $row->ad_url;
	$fdata[]='poll_media';

	$reply=$outObj->message_send('poll', $row->ad_url, $fdata,1);
	print_r($reply);
 	if ($reply['status']=='Y') {	
		foreach($reply['data'] as $k => $v){ 
			if ($v['status']=='Y') {
				$sqlQuery="UPDATE `queue_commands` SET `cq_result`='".serialize($v)."', `cq_status`='".$v['status']."', `cq_wf_step`= '".$v['step']."', `cq_update`='".date("Y-m-d H:i:s", time())."' WHERE `cq_index`=  '".$v['cqIndex']."' ";
		 $query[] = $sqlQuery;
		
				$result = $mysqli->query($sqlQuery);
				$error = $mysqli->info;

				$dataObj->doMessageCompletion($v['mqIndex']);

			}
		}
	}


// Get the actions from the queue table

	$sqlQuery0 = "SELECT * FROM queue_messages AS mq, command_routes AS cr, api_destinations AS ad WHERE cr.cr_action=mq.mq_command AND cr.cr_source=ad.ad_name AND mq.mq_status = 'N' ORDER BY mq.mq_time_start";
// $query =  $sqlQuery0;
	$result0 = $mysqli->query($sqlQuery0);
	if (isset($result0->num_rows)) {
	
// Process the outstanding commands for each message
		while(	$row0 = $result0->fetch_object()) { 
			$m_data = $dataObj->directAction($row0->mq_command, $row0->mq_index, 'queue');	
			$dataObj->doMessageCompletion($row0->mq_index);

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
<br /><?PHP if (isset($reply)) print_r($reply);?><br /><br /> 
<br /><?PHP if (isset($r_data)) print_r($r_data);?><br /><br /> 
<br /><?PHP if (isset($m_data)) print_r($m_data);?><br /><br /> 
<br /><?PHP if (isset($error)) print_r($error);?><br /><br /> 
<br /><?PHP if (isset($query)) print_r($query);?><br /><br /> 
 <form action="" method="post" enctype="application/x-www-form-urlencoded" name="action" id="action">
 
 <select name="action_select" onchange="javascript:submitform();">
 <option value="">Select action ...</option>
 <option value="execute">Execute items in admin queue</option>
 </select>
 
 </form>
 <?PHP // phpinfo(); ?>
</body>
</html>