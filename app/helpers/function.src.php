<?
function smarty_function_src($params,&$smarty){
	$params = array_merge(array(
		"title" => null,
		"add_br" => true
	),$params);
	$url_p = array(
		"namespace" => "",
		"controller" => "sources",
		"action" => "display",
		"file" => $params["file"]
	);
	$url = Atk14Url::BuildLink($url_p);

	$title = isset($params["title"]) ? $params["title"] : $params["file"];

	$out = "<a href=\"$url\">$title</a>";
	if($params["add_br"]){ $out .= "<br />"; }
	return $out;
}
?>
