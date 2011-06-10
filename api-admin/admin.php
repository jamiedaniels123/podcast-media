<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  24th May,2011
	#	Test version  
	#	itest controller to send and display responses to simulate admin end
\*=========================================================================================*/

require_once("./lib/config0.php");
require_once("./lib/classes/output.class.php");

$outObj = new Default_Model_Output_Class();

if (isset($_REQUEST['action_select'])) {
	
	if ($_REQUEST['action_select'] == 'transcode-media') {
		$fdata[]= array('custom_id'=>'', 'fname'=>'firstfile.m4v', 'type'=>'utube', 'encode'=>'500kbs', 'count'=>'1');
		$fdata[]= array('custom_id'=>'', 'fname'=>'secondfile.m4v', 'type'=>'itunes', 'encode'=>'196kbs', 'count'=>'2');
		$number=2;
		$action=$_REQUEST['action_select'];

	}else if ($_REQUEST['action_select'] == 'transcode-media-and-deliver'){
		$fdata[]= array('custom_id'=>'', 'fname'=>'firstfile.m4v', 'type'=>'utube', 'encode'=>'500kbs', 'count'=>'1');
		$fdata[]= array('custom_id'=>'', 'fname'=>'secondfile.m4v', 'type'=>'itunes', 'encode'=>'196kbs', 'count'=>'2');
		$number=2;
		$action=$_REQUEST['action_select'];


	}else if ($_REQUEST['action_select'] == 'transfer-file-to-media-server'){
		$fdata[]= array('custom_id'=>'', 'fname'=>'firstfile.mp4', 'count'=>'1');
		$fdata[]= array('custom_id'=>'', 'fname'=>'secondfile.mp4', 'count'=>'2');
		$fdata[]= array('custom_id'=>'', 'fname'=>'thirdfile.mp4', 'count'=>'3');
		$fdata[]= array('custom_id'=>'', 'fname'=>'fourthfile.mp4', 'count'=>'4');
		$number=4;
		$action=$_REQUEST['action_select'];

	}else if ($_REQUEST['action_select'] == 'transfer-folder-to-media-server'){
		$fdata[]= array('custom_id'=>'', 'foldername'=>'/itunes', 'count'=>'1');
		$number=4;
		$action=$_REQUEST['action_select'];
		
	}else if ($_REQUEST['action_select'] == 'checkfile'){
		$fdata[]= array('custom_id'=>'', 'fname'=>'firstfile.mp4', 'count'=>'1');
		$fdata[]= array('custom_id'=>'', 'fname'=>'secondfile.mp4', 'count'=>'2');
		$fdata[]= array('custom_id'=>'', 'fname'=>'thirdfile.mp4', 'count'=>'3');
		$fdata[]= array('custom_id'=>'', 'fname'=>'fourthfile.mp4', 'count'=>'4');
		$number=4;
		$action=$_REQUEST['action_select'];
		
	}else if ($_REQUEST['action_select'] == 'update-file-metadata'){
		$fdata[]= array('custom_id'=>'', 
		'folder'=>'/', 
		'fname'=>'firstfile.mp4', 
		'account'=>'The account', 
		'author'=>'The author', 
		'comments'=>'Some comments here', 
		'contentId'=>'A content ID',  
		'expirationDate'=>'24/09/2011',  
		'releaseDate'=>'24/09/2010',  
		'revision'=>'1.01',  
		'securityGroup'=>'secure group',  
		'title'=>'Title 1',  
		'type'=>'the data type', 
		'count'=>'1');
		$fdata[]= array('custom_id'=>'', 
		'folder'=>'/', 
		'fname'=>'firstfile.mp4', 
		'account'=>'The account', 
		'author'=>'The author', 
		'comments'=>'Some comments here', 
		'contentId'=>'A content ID',  
		'expirationDate'=>'24/09/2011',  
		'releaseDate'=>'24/09/2010',  
		'revision'=>'1.01',  
		'securityGroup'=>'secure group',  
		'title'=>'Title 1',  
		'type'=>'the data type', 
		'count'=>'2');
		$fdata[]= array('custom_id'=>'', 
		'folder'=>'/', 
		'fname'=>'firstfile.mp4', 
		'account'=>'The account', 
		'author'=>'The author', 
		'comments'=>'Some comments here', 
		'contentId'=>'A content ID',  
		'expirationDate'=>'24/09/2011',  
		'releaseDate'=>'24/09/2010',  
		'revision'=>'1.01',  
		'securityGroup'=>'secure group',  
		'title'=>'Title 1',  
		'type'=>'the data type', 
		'count'=>'3');
		$fdata[]= array('custom_id'=>'', 
		'folder'=>'/', 
		'fname'=>'firstfile.mp4', 
		'account'=>'The account', 
		'author'=>'The author', 
		'comments'=>'Some comments here', 
		'contentId'=>'A content ID',  
		'expirationDate'=>'24/09/2011',  
		'releaseDate'=>'24/09/2010',  
		'revision'=>'1.01',  
		'securityGroup'=>'secure group',  
		'title'=>'Title 1',  
		'type'=>'the data type', 
		'count'=>'4');
		$number=4;
		$action=$_REQUEST['action_select'];
		
	}else if ($_REQUEST['action_select'] == 'set-permissions-folder'){
		$fdata[]= array('custom_id'=>'', 'foldername'=>'/itunes', 'count'=>'1');
		$fdata[]= array('custom_id'=>'', 'foldername'=>'/utube', 'count'=>'2');
		$number=2;
		$action=$_REQUEST['action_select'];

	}else if ($_REQUEST['action_select'] == 'delete-file-on-media-server'){
		$fdata[]= array('custom_id'=>'', 'filename'=>'firstfile.mp4', 'count'=>'1');
		$fdata[]= array('custom_id'=>'', 'filename'=>'secondfile.mp4', 'count'=>'2');
		$fdata[]= array('custom_id'=>'', 'filename'=>'thirdfile.mp4', 'count'=>'3');
		$fdata[]= array('custom_id'=>'', 'filename'=>'fourthfile.mp4', 'count'=>'4');
		$number=4;
		$action=$_REQUEST['action_select'];

	}else if ($_REQUEST['action_select'] == 'delete-folder-on-media-server'){
		$fdata[]= array('custom_id'=>'', 'foldername'=>'/itunes', 'count'=>'1');
		$fdata[]= array('custom_id'=>'', 'foldername'=>'/utube', 'count'=>'2');
		$number=2;
		$action=$_REQUEST['action_select'];
	}else{
		$fdata[]=array('data'=>'some data here!');
		$action='status';
		$number=1;
	}
	
}else{
	$fdata=array('data'=>'some data here!');
	$action='status';
	$number=1;
}


	$result=$outObj->message_send($action, $mediaUrl, $fdata, $number);

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admin post command</title>
<script type="application/x-javascript">
<!--
function submitform()
{
	document.getElementById('action').submit();
}
-->
</script>
</head>

<body>
<?PHP 
echo "<b>Source: </b>".$adminUrl."<br /><br />";
echo "<b>Destination: </b>".$mediaUrl."<br /><br />";
echo "<b>Command: </b>".$action."<br /><br /><b>Sending: </b>";
print_r(json_encode($fdata));
echo "<br /><br /><b>Returns: </b>";
 if (isset($result)) print_r ($result);?>
<br /><br /> 
 <form action="" method="post" enctype="application/x-www-form-urlencoded" name="action" id="action">
 
 <select name="action_select" onchange="javascript:submitform();">
 <option value="">Select action ...</option>
 <option value="">Status</option>
 <option value="transcode-media">C - Transcode media</option>
 <option value="transcode-media-and-deliver">C - Transcode-media-and-deliver</option>
 <option value="transfer-file-to-media-server">C - Transfer-file-to-media-server</option>
 <option value="transfer-folder-to-media-server">C - Transfer-folder-to-media-server</option>
 <option value="delete-file-on-media-server">D - Delete-file(s)-on-media-server</option>
 <option value="delete-folder-on-media-server">D - Delete-folder-on-media-server</option>
 <option value="update-file-metadata">U - Update-file(s)-metadata</option>
 <option value="update-folder-metadata">U - Update-folder-metadata</option>
 <option value="set-permissions-folder">R - Set-permissions-folder</option>
 <option value="check-file-exists">D - Check-file(s)-exists</option>
 <option value="check-folder-exists">D - Check-folder-exists</option>
 </select>
 
 </form>
 <?PHP // phpinfo(); ?>
</body>
</html>
