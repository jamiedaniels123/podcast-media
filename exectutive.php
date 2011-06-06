<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  24th May,2011
	#	Test version  
	#	controller to process actions queued in the media_actions table and report status to the admin server
\*=========================================================================================*/

require_once("./lib/config.php");
require_once("./lib/classes/action.class.php");
require_once("./lib/classes/output.class.php");

// Initialise objects

	$dataObj = new Default_Model_Action_Class();
//	$outObj = new Default_Model_Output_Class();

// Get the actions from the queue table

	$sqlQuery = "SELECT * FROM media_actions AS ma where ma.media_status = 'N' ORDER BY ma.ma_command";
	$res = mysql_query($sqlQuery);
	
// Process the outstanding actions 

	while($actObj=mysql_fetch_object($res)) { 
	
		if ($actObj->ma_command=='addfile'){
				$m_data = $dataObj->doAddFile($data['data'],$data['number']);
				
		}else if ($actObj->ma_command=='checkfile'){
			$m_data = $dataObj->doCheckFile($data['data'],$data['number']);
			
		}else if ($actObj->ma_command=='metadata'){
			$m_data = $dataObj->doMetaData($actObj->ma_data,$actObj->ma_index);
		
		}else if ($actObj->ma_command=='deletefile'){
			$m_data = $dataObj->doDeleteFile($data['data'],$data['number']);
			
		}else if ($actObj->ma_command=='deletefolder'){
			$m_data = $dataObj->doDeleteFolder($data['data'],$data['number']);
		}
	}

// Report the ststus of completed tasks

if (isset($_REQUEST['action_select'])) {
	
	if ($_REQUEST['action_select'] == 'addfile') {
		$fdata[]= array('custom_id'=>'', 'fname'=>'firstfile.m4v', 'type'=>'utube', 'encode'=>'500kbs', 'count'=>'1');
		$fdata[]= array('custom_id'=>'', 'fname'=>'secondfile.m4v', 'type'=>'itunes', 'encode'=>'196kbs', 'count'=>'2');
		$postData=array(	'command'=>'addfile' ,'number'=>1,'data'=>$fdata,'timestamp'=>time());
		$number=2;
		$action=$_REQUEST['action_select'];

	}else if ($_REQUEST['action_select'] == 'deletefile'){
		$fdata[]= array('custom_id'=>'', 'filename'=>'firstfile.mp4', 'count'=>'1');
		$fdata[]= array('custom_id'=>'', 'filename'=>'secondfile.mp4', 'count'=>'2');
		$fdata[]= array('custom_id'=>'', 'filename'=>'thirdfile.mp4', 'count'=>'3');
		$fdata[]= array('custom_id'=>'', 'filename'=>'fourthfile.mp4', 'count'=>'4');
		$number=4;
		$action=$_REQUEST['action_select'];

	}else if ($_REQUEST['action_select'] == 'deletefolder'){
		$fdata[]= array('custom_id'=>'', 'foldername'=>'/itunes', 'count'=>'1');
		$fdata[]= array('custom_id'=>'', 'foldername'=>'/utube', 'count'=>'2');
		$number=2;
		$action=$_REQUEST['action_select'];
		
	}else{
		$fdata[]=array('data'=>'some data here!');
		$action='status';
		$number=1;
	}
	
}else{
	$fdata=array('data'=>'some data here!');
	$action='status';
	$number=1;
}


	$result=$outObj->message_send($action, $mediaUrl, $fdata, $number);
	

?>