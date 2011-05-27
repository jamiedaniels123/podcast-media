<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  24th May,2011
	#	Test version  
	#	itest controller to send and display responses to simulate admin end
\*=========================================================================================*/

require_once("./lib/config.php");
require_once("./lib/classes/output.class.php");

	$outObj = new Default_Model_Output_Class();

	$postData=array(
	'command'=>'status' ,
	'number'=>1,
	'data'=>'some data here!',
	'timestamp'=>time());


	$result=$outObj->rest_helper($mediaUrl, $postData, 'POST', 'json');

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admin post command</title>
</head>

<body>
<?PHP 
echo "<b>Sending: </b>";
print_r($postData);
echo "<br /><br /><b>Returns: </b>";
 if (isset($result)) print_r ($result);?>
</body>
</html>
