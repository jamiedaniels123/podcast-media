<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  24th May,2011
	#	Test version  
	#	controller to process actions queued in the media_actions table and report status to the admin server
\*=========================================================================================*/

require_once("../lib/config.php");
require_once("../lib/classes/action.class.php");
require_once("../lib/classes/output.class.php");

// Initialise objects

	$dataObj = new Default_Model_Action_Class();
	$outObj = new Default_Model_Output_Class();

// Get the actions from the queue table

	$sqlQuery = "SELECT * FROM command_queue AS cq where cq.cq_status = 'N' ORDER BY cq.cq_command";
//	echo $sqlQuery;
	$res = mysql_query($sqlQuery);
	
// Process the outstanding actions 

	while($actObj=mysql_fetch_object($res)) { 
	
		if ($actObj->cq_command=='processfile'){
			$pfi_data[]= unserialize($actObj->cq_data);
			$pfi_data['row']= $actObj->cq_index;
				
		}else if ($actObj->cq_command=='checkfile'){
			$cfi_data[]= unserialize($actObj->cq_data);
			$pfi_data['row']= $actObj->cq_index;

		}else if ($actObj->cq_command=='metadata'){
			$mfi_data[]= unserialize($actObj->cq_data);
			$pfi_data['row']= $actObj->cq_index;

		}else if ($actObj->cq_command=='deletefile'){
			$pfi_data[]= unserialize($actObj->cq_data);
			$pfi_data['row']= $actObj->cq_index;
			
		}else if ($actObj->cq_command=='deletefolder'){
			$pfo_data[]= unserialize($actObj->cq_data);
			$pfi_data['row']= $actObj->cq_index;

		}
	}

		if (isset($pfi_data)){
				
			$m_data = $dataObj->doProcessFile($pfi_data, count($pfi_data));
			$result=$outObj->message_send('processfile', $adminUrl, $m_data['data'], $m_data['number']);
				
		}if (isset($cfi_data)){
			$m_data = $dataObj->doCheckFile($cfi_data, count($cfi_data));
			$result=$outObj->message_send('checkfile', $adminUrl, $m_data['data'], $m_data['number']);
			
		}if (isset($mfi_data)){
			$m_data = $dataObj->doMetaData($mfi_data, count($mfi_data));
			$result=$outObj->message_send('metadata', $adminUrl, $m_data['data'], $m_data['number']);
		
		}if (isset($dfi_data)){
			$m_data = $dataObj->doDeleteFile($dfi_data, count($dfi_data));
			$result=$outObj->message_send('deletefile', $adminUrl, $m_data['data'], $m_data['number']);
			
		}if (isset($dfo_data)){
			$m_data = $dataObj->doDeleteFolder($dfo_data, count($dfo_data));
			$result=$outObj->message_send('deletefolder', $adminUrl, $m_data['data'], $m_data['number']);
		}


// Report the ststus of completed tasks

if (!isset($m_data)) {
	
	$m_data=array('data'=>'Nothing to do!');
	$action='status';
	$number=1;
	$result=$outObj->message_send($action, $adminUrl, $m_data, $number);

}

?>