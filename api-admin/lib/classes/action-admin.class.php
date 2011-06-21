<?php
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  20th Feb,2011
	#	Test version  
	#  Class File to handle file service actions and provide responses.
\*=========================================================================================*/

class Default_Model_Action_Class 
// extends Default_Model_DB_Class
  {
	
	/**  * Constructor  */
    function Default_Model_Action_Class($mysqli,$outObj,$apiName){}  

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

		$retData= array( 'command'=>$action, 'number'=>'', 'data'=>'Queued admin-api!', 'status'=>'', 'timestamp'=>time()) ;
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
		
		if ($retData!='') {$retData['number']=$i;$retData['status']='ACK'; $retData['mqIndex']=$mess_id;} else {$retData['number']=0;$retData['status']='NACK';}
		return $retData;
	}

	public function directAction($action,$mqIndex)
	{
		global $mysqli, $apiName;

		$sqlQuery = "SELECT * FROM queue_commands AS cq, command_routes AS cr,api_workflows AS wf WHERE cq.cq_command=cr.cr_action AND wf.wf_cr_index=cr.cr_index AND cq.cq_wf_step=wf.wf_step AND cr.cr_execute='".$apiName."' AND cq.cq_status = 'N' AND cr.cr_action='".$action."' AND cq.cq_mq_index='".$mqIndex."' AND cr.cr_route_type='direct' ";
		$result = $mysqli->query($sqlQuery);
		if (isset($result->num_rows)) {
		
			// Process the outstanding actions 
			while(	$row = $result->fetch_object()) { 
				$function=$row->cr_function;
				if ($row->cq_result!='') $retData = unserialize($row->cq_result);
				// Call the action with the data
 				$retData = $this->$function(unserialize($row->cq_data),1,$row->cq_index);
				if ($row->wf_steps < $row->wf_step) $step=$row->wf_step +1; else $step=$row->wf_step;
				if ($row->wf_steps == $row->wf_step) $status=$retData['result'];
				$sqlQuery="UPDATE `queue_commands` SET `cq_result`='".serialize($retData)."', `cq_status`='".$status."', `cq_wf_step`='".$step."', `cq_update`='".date("Y-m-d H:i:s", $timestamp)."' WHERE `cq_index`=  '".$cqIndex."' ";
				$result = $mysqli->query($sqlQuery);
				$error = $mysqli->info;
			}
		}
		 return array('mqIndex'=>$mqIndex);
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

	public function doMediaPushFile($mArr,$mNum,$cqIndex)
	{
		global $source, $destination; 

		$retData= array('cqIndex'=>$cqIndex, 'infile'=> '', 'outfile'=> '', 'scp'=>'', 'number'=> $mNum, 'result'=> 'N') ;

// echo $source['admin'].$mArr['infile'].", ".$destination['media'].$mArr['outfile']."<br />";
 		$retData['scp'] = $this->transfer($source['admin'].$mArr['infile'] , $destination['media'].$mArr['outfile']);
// 		$retData['scp'] = $this->transfer1($source1['admin'], $destination1['media'], $mArr['infile'], $mArr['outfile']);

		return $retData;
	}


}
?>