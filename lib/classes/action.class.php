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
	function Default_Model_Action_Class(){}

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

	function getStatus($mArr)
	{
		$retData= array( 'command'=>'statusreply', 'data'=>'OK') ;
		$retNum=1;
		if ($retData!='') $retNum=1; else $retNum=0;
		return array ('resultSet'=>$retData, 'resultNum'=>$retNum);
	}

	function queueAddFile($mArr)
	{
		$retData= array( 'command'=>'statusreply', 'data'=>'OK') ;
		$retNum=1;
		if ($retData!='') $retNum=$rows; else $retNum=0;
		return array ('resultSet'=>$retData, 'resultNum'=>$retNum);
	}

	function queueCheckFile($mArr)
	{
		$retData= array( 'command'=>'statusreply', 'data'=>'OK') ;
		$retNum=1;
		if ($retData!='') $retNum=$rows; else $retNum=0;
		return array ('resultSet'=>$retData, 'resultNum'=>$retNum);
	}

	function queueMetaData($mArr)
	{
		$retData= array( 'command'=>'statusreply', 'data'=>'OK') ;
		$retNum=1;
		if ($retData!='') $retNum=$rows; else $retNum=0;
		return array ('resultSet'=>$retData, 'resultNum'=>$retNum);
	}

	function queueAddImage($mArr)
	{
		$retData= array( 'command'=>'statusreply', 'data'=>'OK') ;
		$retNum=1;
		if ($retData!='') $retNum=$rows; else $retNum=0;
		return array ('resultSet'=>$retData, 'resultNum'=>$retNum);
	}

	function queueAddRss($mArr)
	{
		$retData= array( 'command'=>'statusreply', 'data'=>'OK') ;
		$retNum=1;
		if ($retData!='') $retNum=$rows; else $retNum=0;
		return array ('resultSet'=>$retData, 'resultNum'=>$retNum);
	}

}
?>