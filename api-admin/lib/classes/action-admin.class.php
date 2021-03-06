<?php
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  20th Feb,2011
	#	Test version  
	#  Admin-api Class File to handle file service actions and provide responses.
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

    function PsExec($commandJob) {

        $command = $commandJob.' > /dev/null 2>&1 & echo $!';
        exec($command ,$op);
        $pid = (int)$op[0];
//		print_r ($op);

        if($pid!="") return $pid;

        return false;
    }

    function PsExists($pid) {

        exec("ps ax | grep $pid 2>&1", $output);

        while( list(,$row) = each($output) ) {

                $row_array = explode(" ", $row);
                $check_pid = $row_array[0];

                if($pid == $check_pid) {
                        return true;
                }

        }

        return false;
    }

    function PsKill($pid) {
        exec("kill -9 $pid", $output);
    }

	public function startCheckProcess($apCommand) {

		global $mysqli, $error;
		
		$result0 = $mysqli->query("SELECT ap_process_id, ap_script, ap_status FROM api_process WHERE ap_status = 'Y' ORDER BY ap_timestamp DESC");
		$j=0;
		if ($result0->num_rows >=1) {
			while(	$row0 = $result0->fetch_object()) {
				if ($this->PsExists($row0->ap_process_id)) {
					if ($j==0) {
						$mysqli->query("UPDATE `api_process` SET `ap_status`='Y', `ap_last_checked`='".date("Y-m-d H:i:s", time())."' WHERE `ap_process_id`=  '".$row0->ap_process_id."' ");
						$j=1;
					} else {
						$this->PsKill($row0->ap_process_id);
						$mysqli->query("UPDATE `api_process` SET `ap_status`='N', `ap_last_checked`='".date("Y-m-d H:i:s", time())."' WHERE `ap_process_id`=  '".$row0->ap_process_id."' ");
					}
				} else  {
						$mysqli->query("UPDATE `api_process` SET `ap_status`='N', `ap_last_checked`='".date("Y-m-d H:i:s", time())."' WHERE `ap_process_id`=  '".$row0->ap_process_id."' ");
				}
			}
		}
		if ($j==0) {
				$processID=$this->PsExec($apCommand);
				if ($processID==false) $status='N'; else $status='Y';  
				$result = $mysqli->query("INSERT INTO `api_process` (`ap_process_id`, `ap_script`, `ap_timestamp`, `ap_status`) VALUES ( '".$processID."',  '".$apCommand."', '".date("Y-m-d H:i:s", time())."', '".$status."' )");
		}

	}
	
	public function transfer($src, $dest) {
			
		$cmdline = "/usr/bin/scp -p ".escapeshellcmd($src)." ".escapeshellcmd($dest)." 2>&1";
//		echo "<p>Transfer cmd line =".$cmdline."</p>\n";  // debug
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

	public function getStatus($mArr,$mNum,$mCommand){
		
		$retData= array( 'command'=>'statusReply', 'number'=>'',  'data'=>'') ;
		$dataArr='';		$i=0;		
		while (isset($mArr[$i])){


			$i++;
		}
		if ($retData!='') $retData['number']=$i; else $retData['number']=0;

		return $retData;
	}

	public function queueAction($mArr,$mNum,$action,$timestamp){
		
		global $mysqli;

		$retData= array( 'command'=>$action, 'number'=>'', 'data'=>'Queued admin-api!', 'status'=>'', 'timestamp'=>time()) ;
		$dataArr='';	
		$result = $mysqli->query("INSERT INTO `queue_messages` (`mq_command`, `mq_number`, `mq_time_start`, `mq_status`) VALUES ( '".$action."',  '".$mNum."', '".date("Y-m-d H:i:s", $timestamp)."', 'N' )");
		$mess_id = $mysqli->insert_id;
		$sqlCommands = "INSERT INTO `queue_commands` (`cq_command`, `cq_filename`, `cq_mq_index`, `cq_data`, `cq_time`, `cq_update`, `cq_status`) VALUES ";
		$i=0;
		while (isset($mArr[$i])){
			if($i!=0) $sqlCommands.= ", ";		
//			$nameArr = pathinfo($mArr[$i]['filename']);
			$sqlCommands.= "('".$action."', '".$mArr[$i]['filename']."', '".$mess_id."','".serialize($mArr[$i])."','".date("Y-m-d H:i:s", $timestamp)."', '', 'N')"; 
			$i++;
		}
//	echo $sqlCommands;
		$result = $mysqli->query($sqlCommands);
//		$error .= "queueAcction - ".$mysqli->info;
		
		if ($retData!='') {$retData['number']=$i;$retData['status']='ACK'; $retData['mqIndex']=$mess_id;} else {$retData['number']=0;$retData['status']='NACK';}
		return $retData;
	}

	public function doNextAction($mqIndex,$cqCommand){
		
		global $mysqli, $apiName, $error;

//		for ( $i = 0; $i <= 4; $i++) {
			$result4 = $mysqli->query("SELECT * FROM queue_commands AS cq, command_routes AS cr,api_workflows AS wf WHERE cq.cq_command=cr.cr_action AND wf.wf_cr_index=cr.cr_index AND cq.cq_wf_step=wf.wf_step AND  cq.cq_status = 'N' AND cq.cq_mq_index='".$mqIndex."' AND wf.wf_route_type IN (".$cqCommand.") ");
			if ($result4->num_rows >= 1) $this->processActions($result4);
//		}
		 return array('mqIndex'=>$mqIndex);
	}

	function processActions($resultObj) {

		global $mysqli, $error;

// Process the outstanding actions 
			while(	$row = $resultObj->fetch_object()) {
				$cqResult=unserialize($row->cq_result); 

					$function=$row->wf_function;

// Call the action with the data
					$retData = $this->$function(unserialize($row->cq_data),1,$row->cq_index);
					if ($row->wf_steps > $row->wf_step && $retData['result']=='Y') $step=$row->wf_step +1; else $step=$row->wf_step;
					if ($row->wf_steps == $row->wf_step) $status='Y'; else  $status='N';
					$result = $mysqli->query("UPDATE `queue_commands` SET `cq_result`='".serialize($retData)."', `cq_status`='".$status."', `cq_wf_step`='".$step."', `cq_update`='".date("Y-m-d H:i:s", time())."' WHERE `cq_index`=  '".$row->cq_index."' ");
//					$error .= "ProcessActions - ".$mysqli->info;

			}
	}

	function doMediaPushFile($mArr,$mNum,$cqIndex){
		
		global $source, $destination; 

		$retData= array('cqIndex'=>$cqIndex, 'filename'=> $mArr['filename'], 'source_path'=> $mArr['source_path'], 'destination_path'=> $mArr['destination_path'], 'number'=> 0, 'result'=> 'N') ;
		$outFile = urlencode($mArr['destination_path'].$mArr['filename']);
 		$retData['scp'] = $this->transfer($source['admin'].$mArr['source_path'].$mArr['filename'] , $destination['media'].$outFile);
		if ($retData['scp'][0]==0) $retData['result']='Y';

		return $retData;
	}

	function doPushNextCommand($mArr,$mNum,$cqIndex){
		
		global $mysqli, $outObj;

		$retData= array('cqIndex'=>$cqIndex, 'number'=> $mNum, 'result'=> 'N') ;
		$postRetData['status']='N';
 		$result5 = $mysqli->query("SELECT * FROM queue_commands AS cq, api_workflows AS wf, command_routes AS cr, api_destinations as ad WHERE cq.cq_command=cr.cr_action AND cr.cr_index=wf.wf_cr_index AND wf.wf_ad_index=ad.ad_index AND wf.wf_step = 1 + cq.cq_wf_step AND cq.cq_index='".$cqIndex."'");
		$row5 = $result5->fetch_object();

		$postRetData=$outObj->message_send_next_command($row5->wf_command,  $row5->ad_url, $cqIndex,  $row5->cq_mq_index, $row5->wf_step, $mArr, $mNum);
// print_r($postRetData);
		// if ($postRetData['status']=='ACK') 
		$retData['result']='Y';
		$retData['debug']=$postRetData;

		return $retData;
	}

	public function doMessageCompletion($mqIndex){
		
		global $mysqli, $outObj;
		
		$result="Checking - ".$mqIndex;
		
		$result6 = $mysqli->query("SELECT count(cq.cq_index) AS num, mq.mq_number, ad.ad_url, cr.cr_callback FROM queue_messages AS mq, queue_commands cq, command_routes AS cr, api_destinations as ad WHERE mq.mq_index=cq.cq_mq_index AND cr.cr_action=mq.mq_command AND cr.cr_source=ad.ad_name AND mq.mq_index = '".$mqIndex."' AND cq.cq_status='Y'");
		if ($result6->num_rows!=0) {
			$row6 = $result6->fetch_object();
			if ($row6->num == $row6->mq_number) {
				$result3 = $mysqli->query("SELECT * FROM queue_messages AS mq, queue_commands cq WHERE mq.mq_index=cq.cq_mq_index AND mq.mq_index = '".$mqIndex."'");
				$i=0;
				while(	$row3 = $result3->fetch_object()){
					$r_data[]= unserialize($row3->cq_result); 
					$i++;
				}
				$result2 = $mysqli->query("UPDATE `queue_messages` SET `mq_time_complete` = '".date("Y-m-d H:i:s", time())."' ,`mq_status`= 'R', `mq_result`='".serialize($r_data)."' where mq_index='".$mqIndex."' ");

			}
		}
		return $result;

	}
	
	public function doCallback(){
		
		global $mysqli, $outObj;

		$result2 = $mysqli->query( "SELECT mq.mq_index, mq.mq_status, mq.mq_number, mq.mq_result, mq_retry_count, ad.ad_url, cr.cr_callback FROM queue_messages AS mq, command_routes AS cr, api_destinations AS ad WHERE cr.cr_action=mq.mq_command AND cr.cr_source=ad.ad_name AND mq.mq_status IN('S','R') ORDER BY mq.mq_time_start");
		if (isset($result2->num_rows)) {
	
			while(	$row2 = $result2->fetch_object()) { 
	
				$mqResArr = unserialize($row2->mq_result);
				$result3=$outObj->message_send($row2->cr_callback, $row2->ad_url, $mqResArr, $row2->mq_number);

// $result3['status']="ACK"; // Fix the result until the admin can return a useful response.
				if ($result3['status'] == "NACK" ) {
					$mysqli->query("UPDATE `queue_messages` SET `mq_status`= 'F' where mq_index='".$row2->mq_index."' ");
				}  else  if ($result3['status'] == "ACK"){
					$mysqli->query("UPDATE `queue_messages` SET `mq_status`= 'C' where mq_index='".$row2->mq_index."' ");					
					$mysqli->query("UPDATE `queue_commands` SET `cq_status`= 'C' where cq_mq_index='".$row2->mq_index."' AND `cq_status`='Y' ");					
				} else if ($row2->mq_retry_count<1) {
					$mysqli->query("UPDATE `queue_messages` SET `mq_status`= 'R', `mq_retry_count`= mq_retry_count + 1 where mq_index='".$row2->mq_index."' ");
				} else {
					$mysqli->query("UPDATE `queue_messages` SET `mq_status`= 'T' where mq_index='".$row2->mq_index."' ");
				}			
			}
		}
	}

}
?>