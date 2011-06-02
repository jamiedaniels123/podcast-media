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

	public function getStatus($mArr,$mNum)
	{
		$retData= array( 'command'=>'statusReply', 'number'=>'',  'data'=>'Logging data payload here') ;
		$dataArr='';
		$i=0;		while (isset($mArr[$i])){$i++;
		}
if ($retData!='') $retData['number']=$i; else $retData['number']=0;
		return $retData;
	}

	public function queueAction($mArr,$mNum,$action)
	{
		$retData= array( 'command'=>$action, 'number'=>'', 'data'=>'Queued!') ;
		$dataArr='';
		$i=0;		while (isset($mArr[$i])){$i++;
		}
if ($retData!='') $retData['number']=$i; else $retData['number']=0;
		return $retData;
	}


	public function doAddFile($mArr,$mNum)
	{
		$retData= array( 'command'=>'addfileReply', 'number'=>'', 'data'=>'Logging data payload here') ;
		$dataArr='';
		$i=0;		while (isset($mArr[$i])){$i++;
		}
if ($retData!='') $retData['number']=$i; else $retData['number']=0;
		return $retData;
	}

	public function doCheckFile($mArr,$mNum)
	{
		$retData= array( 'command'=>'checkfileReply', 'number'=>'', 'data'=>'Logging data payload here') ;
		$dataArr='';
		$i=0;		while (isset($mArr[$i])){$i++;
		}
if ($retData!='') $retData['number']=$i; else $retData['number']=0;
		return $retData;
	}

	public function doMetaData($mArr,$mNum)
	{
//		$mArr = $this->objectToArray($mArr);
//	print_r($mArr);
		$retData= array( 'command'=>'metadataReply', 'number'=>'', 'data'=>'Logging data payload here') ;
		$dataArr='';
		$i=0;
		while (isset($mArr[$i])){$i++;
		}
		if ($retData!='') $retData['number']=$i+1; else $retData['number']=0;
		return $retData;
	}

	public function doDeleteFile($mArr,$mNum)
	{
		$retData= array( 'command'=>'deleteFileReply', 'number'=>'', 'data'=>'Logging data payload here') ;
		$dataArr='';
		$i=0;
		while (isset($mArr[$i])){$i++;
		}
		if ($retData!='') $retData['number']=$i; else $retData['number']=0;
		return $retData;
	}

	public function doDeleteFolder($mArr,$mNum)
	{
		$retData= array( 'command'=>'deleteFolderReply', 'number'=>'', 'data'=>'Logging data payload here') ;
		$dataArr='';
		$i=0;		while (isset($mArr[$i])){$i++;
		}
if ($retData!='') $retData['number']=$i; else $retData['number']=0;
		return $retData;
	}

}
?>