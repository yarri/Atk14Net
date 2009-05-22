<?
/**
* <html>
* <head>
*		<title>My Shiny Web Application</title>
*		{placeholder for="head"}
* </head>
*	<body>
* 	{placeholder for="main"}
*	</body>
*	</html>
*/
function smarty_function_placeholder($params,&$smarty){
	if(!isset($params["for"])){ $params["for"] = "main"; }
	$id = $params["for"];

	if(!isset($smarty->atk14_contents) || !isset($smarty->atk14_contents[$id])){
		//echo "<h1>no content for $id</h1>";
		return "";
	}
	//echo "<h1>content found for $id (".strlen($smarty->atk14_contents[$id])." chars)</h1>";

	return $smarty->atk14_contents[$id];
}
?>
