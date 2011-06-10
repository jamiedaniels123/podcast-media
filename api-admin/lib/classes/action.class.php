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
	   
	function delTree($dir) {
		$files = glob( $dir . '*', GLOB_MARK );
		foreach( $files as $file ){
			if( substr( $file, -1 ) == '/' )
				delTree( $file );
			else
				unlink( $file );
		}
	   
		if (is_dir($dir)) rmdir( $dir );
   
	} 
	
	function deleteAll($directory, $empty = true) {
		if(substr($directory,-1) == "/") {
			$directory = substr($directory,0,-1);
		}
	
		if(!file_exists($directory) || !is_dir($directory)) {
			return false;
		} elseif(!is_readable($directory)) {
			return false;
		} else {
			$directoryHandle = opendir($directory);
		   
			while ($contents = readdir($directoryHandle)) {
				if($contents != '.' && $contents != '..') {
					$path = $directory . "/" . $contents;
				   
					if(is_dir($path)) {
						deleteAll($path);
					} else {
						unlink($path);
					}
				}
			}
		   
			closedir($directoryHandle);
	
			if($empty == false) {
				if(!rmdir($directory)) {
					return false;
				}
			}
		   
			return true;
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

		$dataArr='';	
	
		$sqlQuery = "INSERT INTO `queue_commands` (`cq_command`, `cq_data`, `cq_time`, `cq_update`,`cq_status`) VALUES ";
		$i=0;
		while (isset($mArr[$i])){
			if($i!=0) $sqlQuery.= ", ";
			$sqlQuery.= "('".$action."','".serialize($mArr[$i])."','".date("Y-m-d H:i:s", $timestamp)."', '', 'Y')"; 
			$i++;
		}
//	echo $sqlQuery;
		$result = $mysqli->query($sqlQuery);
		$error = $mysqli->info;
		$result=$outObj->message_send($action, $mediaUrl, $mArr, $mNum);
		$retData= array( 'command'=>$action, 'number'=>'', 'data'=>json_decode($result)) ;
		if ($retData!='') $retData['number']=$i; else $retData['number']=0;
		return $retData;
	}


	public function doProcessFile($mArr,$mNum)
	{
		$retData= array( 'command'=>'addfileReply', 'number'=>'', 'data'=>'Logging data payload here') ;
		$dataArr='';		$i=0;		
		while (isset($mArr[$i])){
			print_r($mArr[$i]);
			$i++;
		}
		if ($retData!='') $retData['number']=$i; else $retData['number']=0;
		return $retData;
	}

	public function doCheckFile($mArr,$mNum)
	{
		$retData= array( 'command'=>'checkfileReply', 'number'=>'', 'data'=>'Logging data payload here') ;
		$dataArr='';		$i=0;		
		while (isset($mArr[$i])){
			print_r($mArr[$i]);
			$i++;
		}
		if ($retData!='') $retData['number']=$i; else $retData['number']=0; 
		return $retData;
	}

	public function doMetaData($mArr,$mNum)
	{
//		$mArr = $this->objectToArray($mArr);
//	print_r($mArr);
		$retData= array( 'command'=>'metadataReply', 'number'=>'', 'data'=>'Logging data payload here') ;
		$dataArr='';		$i=0;		
		while (isset($mArr[$i])){
			print_r($mArr[$i]);
			$i++;
		}
		if ($retData!='') $retData['number']=$i+1; else $retData['number']=0;
		return $retData;
	}

	public function doDeleteFile($mArr,$mNum)
	{
		$retData= array( 'command'=>'deleteFileReply', 'number'=>'', 'data'=>'Logging data payload here') ;
		$dataArr='';		$i=0;		
		while (isset($mArr[$i])){
			print_r($mArr[$i]);
			$i++;
		}
if ($retData!='') $retData['number']=$i; else $retData['number']=0;
		return $retData;
	}

	public function doDeleteFolder($mArr,$mNum)
	{
		$dataArr='';		$i=0;		
		while (isset($mArr[$i])){
			print_r($mArr[$i]);
			$i++;
		}
		$retData= array( 'command'=>'deleteFolderReply', 'number'=>$i, 'data'=>$mArr[$i]) ;
		return $retData;
	}

}
?>