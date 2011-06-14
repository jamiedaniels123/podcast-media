<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Transfer Example</title>
	</head>
	<body>

  <?php 
  $source = array(
  	'admin' => 'admin-transfer-dev@podcast-admin-dev.open.ac.uk:/data/web/podcast-admin-dev.open.ac.uk/file-transfer/source/',
  	'media' => 'media-transfer-dev@podcast-media-dev.open.ac.uk:/data/web/podcast-media-dev.open.ac.uk/file-transfer/source/',
  	'encoder' => 'Volumes/Data/Episode/EpisodeEngine/Outputs/'
  );
  
  $destination = array(
  	'admin' => 'admin-transfer-dev@podcast-admin-dev.open.ac.uk:/data/web/podcast-admin-dev.open.ac.uk/file-transfer/destination/',
  	'media' => 'media-transfer-dev@podcast-media-dev.open.ac.uk:/data/web/podcast-media-dev.open.ac.uk/file-transfer/destination/',
  	'encoder' => 'Volumes/Data/Episode/EpisodeEngine/Inputs/'
  );
  
  function transfer($src, $dest) {
  	
  	// Note: SCP is executed as user '_www' and it's home directory is /Library/WebServer/
  	// thus the secure keys are located in ~/.shh/ and the relevant key needs to be copied
  	// onto the relevant user account of each destination server.  Note: exact user/server set
  	// in global array $source and $destination.
  	
    $cmdline = "/usr/bin/scp -p ".escapeshellcmd($src)." ".escapeshellcmd($dest)." 2>&1";
  	echo "<p>Transfer cmd line =".$cmdline."</p>\n";  // debug
  	
  	//error_log("Transfer cmd line =".$cmdline);  // debug
  
  	exec($cmdline, $out, $code);
  
  	return array($code, $out);
  }
  
  // FILENAMES AND PATHS MUST NOT HAVE SPACES IN THEM
  
  $worflowFolder="video-wide/";
  $filename="dd205-mexico-hazardous-crossing-c.mov";
  
  $transfer = transfer($source['encoder'].$worflowFolder.$filename, $destination['admin'].$worflowFolder.$filename);
  
  print_r($transfer);
  echo "<br>\n";
  
  if ($transfer[0] == 0) {
    echo "<p>Transfered file successful</p>\n";
  } else {
    echo "<p>Failed to transfered file</p>\n";
  }
  
  ?>

	</body>
</html>
