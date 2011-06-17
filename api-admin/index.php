<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  24th May,2011
	#	Test version  
	#	input controller to accept post requests from the admin server
\*=========================================================================================*/

require_once("./lib/config.php");
require_once("./lib/classes/action-admin.class.php");
require_once("./lib/classes/output.class.php");

$mysqli = new mysqli($dbLogin['dbhost'], $dbLogin['dbusername'], $dbLogin['dbuserpass'], $dbLogin['dbname']);

$dataStream = file_get_contents("php://input");

$dataMess=explode('=',urldecode($dataStream));

if ($dataMess[1]!='') {

	$data=json_decode($dataMess[1],true);
//print_r($data);

	$outObj = new Default_Model_Output_Class();
	
	$dataObj = new Default_Model_Action_Class($mysqli);	


	$sqlQuery = "SELECT * FROM command_routes AS cr, api_destinations as ad where cr.cr_destination=ad.ad_name AND cr.cr_action = '".$data['command']."'";

// echo 	$sqlQuery;
	$result = $mysqli->query($sqlQuery);
	$row = $result->fetch_object();
	
	if ($result->num_rows) {

		$m_data[] = $dataObj->queueAction($data['data'],$data['number'],$data['command'],$data['timestamp']);

// echo $data['command'].", ".$mediaUrl.", ".$data['data'].", ".$data['number'];
		$m_data[]=$outObj->message_send($data['command'], $row->ad_url, $data['data'], $data['number']);
//		$m_data[] = array('status'=>'ACK', 'data'=>'Command sent to ! '.$row->ad_url, 'timestamp'=>time());

	}else{
		$m_data[] = array('status'=>'NACK', 'data'=>'Command not known on admin-api !', 'sqlQuery'=>$sqlQuery, 'timestamp'=>time());

	}

}else{
	$m_data[] = array('status'=>'NACK', 'data'=>'No request values set!', 'timestamp'=>time());

}
	$sqlLogging = "INSERT INTO `api_log` (`al_datastream`, `al_message`, `al_timestamp`) VALUES ( '".urldecode($dataStream)."', '".serialize($m_data)."', '".date("Y-m-d H:i:s", time())."' )";
	$result = $mysqli->query($sqlLogging);
// echo "mediaUrl-".$row->ad_url;
// print_r ($m_data);
$jsonData = json_encode($m_data);
echo $jsonData;

?>