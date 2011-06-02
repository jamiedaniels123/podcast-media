<?php
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  26th May,2011
	#	Test version  
	#  Class File to handle output CURL response.
\*=========================================================================================*/

class Default_Model_Output_Class
 {
	
	/**  * Constructor  */
	function Default_Model_Output_Class(){}


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

	function do_post_request($url, $data, $optional_headers = null){

		$params = array('http' => array(	'method' => 'post', 'content' => $data ));
		if ($optional_headers!== null) { 
			$params['http']['header'] = $optional_headers;
		}
		$ctx = stream_context_create($params);
		$fp = @fopen($url, 'rb', false, $ctx);
		if (!$fp) {
			throw new Exception("Problem with $url, $php_errormsg");
		}
		$response = @stream_get_contents($fp);
		if ($response === false) {
		throw new Exception("Problem reading data from $url, $php_errormsg");
		}
		return $response;
	} 

	function rest_helper($url, $params = null, $verb = 'GET', $format = 'json'){

		$cparams = array('http' => array( 'method' => $verb, 'ignore_errors' => true));
		if ($params !== null) {
			$params = http_build_query($params);
			if ($verb == 'POST') {
			  $cparams['http']['content'] = $params;
			  $cparams['http']['header'] = 'Content-Type: application/x-www-form-urlencoded\r\n';
			} else {
			  $url .= '?' . $params;
			}
		}

		$context = stream_context_create($cparams);

		$fp = fopen($url, 'rb', false, $context);
		if (!$fp) {
			$res = false;
		} else {
			// If you're trying to troubleshoot problems, try uncommenting the
			// next two lines; it will show you the HTTP response headers across
			// all the redirects:
//			 $meta = stream_get_meta_data($fp);
//			 var_dump($meta['wrapper_data']);
			$res = stream_get_contents($fp);
		}
		
		if ($res === false) {
			throw new Exception("$verb $url failed: $php_errormsg");
		}
		
		switch ($format) {
		case 'json':
		$r=$res;
// 		  $r = json_decode($res,true);

		  if ($r === null) {
			throw new Exception("failed to decode $res as json");
		  }
		  return $r;
		
		case 'xml':
		  $r = simplexml_load_string($res);
		  if ($r === null) {
			throw new Exception("failed to decode $res as xml");
		  }
		  return $r;
		}
		return $res;
	}

}


?>