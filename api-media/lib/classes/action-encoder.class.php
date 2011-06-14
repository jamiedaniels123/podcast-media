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
		$sqlQuery = "INSERT INTO `queue_commands` (`cq_command`, `cq_data`, `cq_time`, `cq_update`,`cq_status`) VALUES ";
		$i=0;
		while (isset($mArr[$i])){
			if($i!=0) $sqlQuery.= ", ";
			$sqlQuery.= "('".$action."','".serialize($mArr[$i])."','".date("Y-m-d H:i:s", $timestamp)."', '', 'N')"; 
			$i++;
		}
//	echo $sqlQuery;
		$result = $mysqli->query($sqlQuery);
		$error = $mysqli->info;
		if ($retData!='') $retData['number']=$i; else $retData['number']=0;
		return $retData;
	}

	public function directAction($mArr,$mNum,$action,$timestamp)
	{
		global $mysqli,$outObj,$mediaUrl;

		$i=0;
		while (isset($mArr[$i])){


			$i++;
		}
//	echo $sqlQuery;
		$retData= array( 'command'=>$action, 'number'=>'', 'data'=>json_decode($result)) ;
		if ($retData!='') $retData['number']=$i; else $retData['number']=0;
		return $retData;
	}


	public function doTranscodeMedia($mArr,$mNum)
	{
		$retData= array( 'infile'=> '', 'outfile'=> '','number'=> $mNum, 'result'=> 'success/fail') ;

		return $retData;
	}

	public function doTranscodeMediaAndDeliver($mArr,$mNum)
	{
		$retData= array( 'infile'=> '', 'outfile'=> '','number'=> $mNum, 'result'=> 'success/fail') ;

		return $retData;
	}

	public function doStatusEncoder($mArr,$mNum)
	{
		$retData= array( 'infile'=> '', 'outfile'=> '','number'=> $mNum, 'result'=> 'success/fail') ;

		return $retData;
	}

}
?>