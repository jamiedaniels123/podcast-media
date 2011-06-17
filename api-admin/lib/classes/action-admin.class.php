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
	
	function dir_tree($dir) {
		$path = '';
		$stack[] = $dir;
		while ($stack) {
		   $thisdir = array_pop($stack);
		   $reldir = substr($thisdir,strlen($dir));
		   if ($dircont = scandir($thisdir)) {
			   $i=0;
			   while (isset($dircont[$i])) {
				   if ($dircont[$i] !== '.' && $dircont[$i] !== '..') {
					   $current_file = "{$thisdir}/{$dircont[$i]}";
					   if (is_file($current_file)) {
						   $path[] = "{$reldir}/{$dircont[$i]}";
					   } elseif (is_dir($current_file)) {
							$path[] = "{$reldir}/{$dircont[$i]}";
						   $stack[] = $current_file;
					   }
				   }
				   $i++;
			   }
		   }
		}
		return $path;
	}

	public function transfer($src, $dest) {
			
		$cmdline = "/usr/bin/scp -pv ".escapeshellcmd($src)." ".escapeshellcmd($dest)." 2>&1";
		echo "<p>Transfer cmd line =".$cmdline."</p>\n";  // debug
		
		//error_log("Transfer cmd line =".$cmdline);  // debug
	  
		exec($cmdline, $out, $code);
	  
		return array($code, $out);
	  }
	   
	public function transfer1($src, $dest, $srcfile, $destfile) {
			
		$connection = ssh2_connect($dest['server'], 22, array('hostkey'=>'ssh-rsa'));
		
		if (ssh2_auth_hostbased_file($connection, $dest['user'], $src['server'],
									 '/usr/local/etc/hostkey_rsa.pub',
									 '/usr/local/etc/hostkey_rsa', 'secret',
									  $src['user'])) {
		  echo "Public Key Hostbased Authentication Successful\n";
		  ssh2_scp_send($connection, '/local/filename', '/remote/filename', 0644);

		} else {
		  die('Public Key Hostbased Authentication Failed');
		}
		
		return array($code, $out);
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

		$retData= array( 'command'=>$action, 'number'=>'', 'data'=>'Queued admin-api!', 'status'=>'') ;
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
		if ($retData!='') {$retData['number']=$i;$retData['status']='ACK';} else {$retData['number']=0;$retData['status']='NACK';}
		return $retData;
	}

	public function execAction($mArr,$cqIndex,$function,$timestamp)
	{
		global $mysqli,$outObj,$mediaUrl;
		
		$retData = $this->$function($mArr,1,$cqIndex);
		$sqlQuery="UPDATE `queue_commands` SET `cq_result`='".serialize($retData)."', `cq_status`='".$retData['result']."', `cq_update`='".date("Y-m-d H:i:s", $timestamp)."' WHERE `cq_index`=  '".$cqIndex."' ";
		$result = $mysqli->query($sqlQuery);
		$error = $mysqli->info;
//		echo $sqlQuery."-".$error;

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
	
	public function doTransferFileToMediaServer($mArr,$mNum,$cqIndex)
	{
		global $source, $destination; 

		$retData= array('cqIndex'=>$cqIndex, 'infile'=> '', 'outfile'=> '', 'scp'=>'', 'number'=> $mNum, 'result'=> 'N') ;

// echo $source['admin'].$mArr['infile'].", ".$destination['media'].$mArr['outfile']."<br />";
 		$retData['scp'] = $this->transfer($source['admin'].$mArr['infile'] , $destination['media'].$mArr['outfile']);
// 		$retData['scp'] = $this->transfer1($source1['admin'], $destination1['media'], $mArr['infile'], $mArr['outfile']);

		return $retData;
	}

	public function doTransferFolderToMediaServer($mArr,$mNum,$cqIndex)
	{
		$retData= array('cqIndex'=>$cqIndex, 'infile'=> '', 'outfile'=> '','number'=> $mNum, 'result'=> 'success/fail') ;

		return $retData;
	}


}
?>