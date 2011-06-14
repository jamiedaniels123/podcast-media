<?php
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  20th Feb,2011
	#	Test version  
	#  Class File to handle file service actions and provide responses.
\*=========================================================================================*/

class Default_Model_Action_Class
 {
	
	/**  * Constructor  */
    function Default_Model_Action_Class($mysqli,$outObj){}  

// ------ User stuff

	function objectToArray($d) {
		if (is_object($d)) {
			$d = get_object_vars($d);
		}
	
		if (is_array($d)) {
			return array_map(__FUNCTION__, $d);
		}
		else {
			return $d;
		}
	}
	   
	public function getStatus($mArr,$mNum,$mCommand)
	{
		$retData= array( 'command'=>'statusReply', 'number'=>'',  'data'=>'') ;
		$dataArr='';		$i=0;		
		while (isset($mArr[$i])){
			
			$i++;
		}
		if ($retData!='') $retData['number']=$i; else $retData['number']=0;
		return $retData;
	}

	public function queueAction($mArr,$mNum,$action,$timestamp)
	{
		global $mysqli;

		$retData= array( 'command'=>$action, 'number'=>'', 'data'=>'Queued!') ;
		$dataArr='';	
		$sqlMessages = "INSERT INTO `queue_messages` (`mq_command`, `mq_time_start`) VALUES ( '".$action."', '".date("Y-m-d H:i:s", $timestamp)."' )";
//	echo $sqlMessages;
		$result = $mysqli->query($sqlMessages);
		$mess_id = $mysqli->insert_id;
		$sqlCommands = "INSERT INTO `queue_commands` (`cq_command`, `cq_message_id`, `cq_data`, `cq_time`, `cq_update`, `cq_status`) VALUES ";
		$i=0;
		while (isset($mArr[$i])){
			if($i!=0) $sqlCommands.= ", ";
			$sqlCommands.= "('".$action."', '".$mess_id."','".serialize($mArr[$i])."','".date("Y-m-d H:i:s", $timestamp)."', '', 'N')"; 
			$i++;
		}
//	echo $sqlCommands;
		$result = $mysqli->query($sqlCommands);
		$error = $mysqli->info;
		if ($retData!='') $retData['number']=$i; else $retData['number']=0;
		return $retData;
	}

	public function returnAction($mArr,$mNum,$action,$function,$timestamp)
	{
		global $mysqli,$outObj,$mediaUrl;
		$i=0;
		while (isset($mArr[$i])){
			$retData[] = $this->$function($mArr[$i],$i);
			$sqlQuery = "UPDATE `queue_commands` SET `cq_update` = '".date("Y-m-d H:i:s", $timestamp)."' ,`cq_status`= 'Y', cq_result='".$mArr[$i]['data']."' where cq_index='".$mArr[$i]['command_id']."' ";
			$result = $mysqli->query($sqlQuery);
//			$error = $mysqli->info;
			$messages[]['message_id'] = $mArr[$i]['message_id'];
			$i++;
		}
//	echo $sqlQuery;
		return $messages;
	}

}
?>