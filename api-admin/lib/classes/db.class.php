<?php
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  26th May,2011
	#	Test version  
	#  Class File to handle DB stuff.
\*=========================================================================================*/

class Default_Model_DB_Class
 {
	
	/**  * Constructor  */
	function Default_Model_DB_Class($mysqli){}

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

	function getFromQueue(){

		$result= '';
		return $result;
	} 

	function updateQueue(){

		$result= '';
		return $result;
	}

}


?>