<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  24th May,2011
	#	test version  
	#	input controller to accept post requests from the admin server
\*=========================================================================================*/

require_once("./lib/config.php");
require_once("./lib/classes/action.class.php");
require_once("./lib/classes/output.class.php");

if ($_REQUEST!='') {
		$data = array('status'=>'ACK', 'data'=>'Request received processing!', 'timestamp'=>time() );
		$continue=1;
	}else{
		$data = array('status'=>'NACK', 'data'=>'No request values set!', 'timestamp'=>time());
		$continue=0;
	}

 echo json_encode($data);

If ($continue=1){

	$dataObj = new Default_Model_Action_Class();
	$outObj = new Default_Model_Output_Class();
	
	if (isset($_REQUEST['status'])) {
		$m=json_decode($_REQUEST['status']);
		$m_dataArr = $dataObj->getStatus($m['data']);
		$m_data = $m_dataArr['resultSet'];
		$m_rows = $m_dataArr['resultNum'];
		
	}else if (isset($_REQUEST['addfile'])){
		$m=json_decode($_REQUEST['addfile']);
		$m_dataArr = $dataObj->queueAddfile($m['data']);
		$m_data = $m_dataArr['resultSet'];
		$m_rows = $m_dataArr['resultNum'];
		
	}else if (isset($_REQUEST['checkfile'])){
		$m=json_decode($_REQUEST['checkfile']);
		$m_dataArr = $dataObj->queueCheckfile($m['data']);
		$m_data = $m_dataArr['resultSet'];
		$m_rows = $m_dataArr['resultNum'];
		
	}else if (isset($_REQUEST['metadata'])){
		$m=json_decode($_REQUEST['metadata']);
		$m_dataArr = $dataObj->queueMetadata($m['data']);
		$m_data = $m_dataArr['resultSet'];
		$m_rows = $m_dataArr['resultNum'];
	
	}else if (isset($_REQUEST['image'])){
		$m=json_decode($_REQUEST['image']);
		$m_dataArr = $dataObj->queueAddImage($m['data']);
		$m_data = $m_dataArr['resultSet'];
		$m_rows = $m_dataArr['resultNum'];
	
	}else if (isset($_REQUEST['rssfile'])){
		$m=json_decode($_REQUEST['rssfile']);
		$m_dataArr = $dataObj->queueAddRss($m['data']);
		$m_data = $m_dataArr['resultSet'];
		$m_rows = $m_dataArr['resultNum'];
	
	}else{
		$m['data']='';
		$m_dataArr = $dataObj->getStatus($m['data']);
		$m_data = $m_dataArr['resultSet'];
		$m_rows = $m_dataArr['resultNum'];
	}
	
	if ($m_data!='') {
		$jsonData = json_encode($m_data);
//	echo $jsonData;
//	$outObj->rest_helper($adminUrl, $m_Data, 'POST', 'json');


//		$outObj->do_post_request($adminUrl, $jsonData, $optional_headers = null);
	}else{
		if (isset($m['number'])) $mNumber=$m['number']; else $mNumber=0;
		$m_data=array('command'=>'' ,'number'=>0, 'failed'=>$mNumber, 'data'=>'', 'reason'=>'Failed All!');
	
//		$outObj->rest_helper($adminUrl, $m_Data, 'POST', 'json');

		$jsonData = json_encode($m_data);
//	echo $jsonData;
		
//		$outObj->do_post_request($adminUrl, $jsonData, $optional_headers = null);
	}

}

?>