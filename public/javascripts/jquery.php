<?php
header("Content-Type: text/javascript; charset=UTF-8");
header("Cache-Control: public");
header("Last-Modified: ".gmdate("D, d M Y H:i:s",filemtime(__FILE__))." GMT");
header("Expires: ".gmdate("D, d M Y H:i:s", time() + 60 * 60 * 24 * 365)." GMT");
if(isset($headers["If-Modified-Since"])){
	header("HTTP/1.0 304 Not Modified");
	exit;
}

ob_start('ob_gzhandler');
foreach(array(
	'jquery/jquery-1.3.2.min.js',
	'jquery/plugins/livequery/jquery.livequery.js',
	'jquery/plugins/jquery.unobfuscate.js',
) as $fn) {
	echo file_get_contents($fn);
	echo ";\n"; // accommodate scripts which are missing a trailing semicolon
}
ob_end_flush();
?>
