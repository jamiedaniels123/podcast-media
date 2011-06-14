<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  24th May,2011
	#	Test version  
	#	input controller to accept post requests from the admin server
\*=========================================================================================*/

require_once("./lib/config.php");
require_once("./lib/classes/action-encoder.class.php");
require_once("./lib/classes/output.class.php");

$dataStream = file_get_contents("php://input");

$dataMess=explode('=',urldecode($dataStream));
// print_r($dataMess[1]);

if ($dataMess[1]!='') {

	$data=json_decode($dataMess[1],true);
//print_r($data);

	$mysqli = new mysqli($dbLogin['dbhost'], $dbLogin['dbusername'], $dbLogin['dbuserpass'], $dbLogin['dbname']);

	$outObj = new Default_Model_Output_Class();

	$dataObj = new Default_Model_Action_Class($mysqli,$outObj);	

	$sqlQuery = "SELECT * FROM command_routes AS cr where cr.cr_action = '".$data['command']."'";

// echo 	$sqlQuery;
	$result = $mysqli->query($sqlQuery);
	$row = $result->fetch_object();
	
	if ($result->num_rows) {

		if ($row->cr_route_type=='queue'){
			$m_data = $dataObj->queueAction($data['data'],$data['number'],$data['command'],$data['timestamp']);
		
		}else if ($row->cr_route_type=='direct'){
			$m_data = $dataObj->directAction($data['data'],$data['number'],$data['command'],$data['timestamp']);
		
		}

	}else{
		$m_data = array('status'=>'NACK', 'data'=>'Command not known!', 'timestamp'=>time());

	}
	

}else{
	$m_data = array('status'=>'NACK', 'data'=>'No request values set!', 'timestamp'=>time());

}

$jsonData = json_encode($m_data);
echo $jsonData;

?>