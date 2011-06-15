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

	$dataObj = new Default_Model_Action_Class();
	$outObj = new Default_Model_Output_Class();
	$mysqli = new mysqli($dbLogin['dbhost'], $dbLogin['dbusername'], $dbLogin['dbuserpass'], $dbLogin['dbname']);

// Get the actions from the queue table

	$sqlQuery = "SELECT * FROM command_queue AS cq, command_routes AS cr where cq.cq_command=cr.cr_action AND cq.cq_status = 'N' ORDER BY cq.cq_command";
//	echo $sqlQuery;
	$result = $mysqli->query($sqlQuery);
	if ($result->num_rows) {
	
// Process the outstanding actions 

		while(	$row = $result->fetch_object()) { 

			$pfi_data = array( 'row'=>$result->cq_index, 'data'=>unserialize($result->cq_data));
				
				
				
		}
	}

// Report the ststus of completed tasks

if (!isset($m_data)) {
	
	$m_data=array('data'=>'Nothing to do!');
	$action='status';
	$number=1;
	$result=$outObj->message_send($action, $adminUrl, $m_data, $number);

}

?>