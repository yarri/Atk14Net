<?php
function smarty_function_src($params,&$smarty){
	$params = array_merge(array(
		"title" => null,
		"add_br" => true,
		"data_type" => "html"
	),$params);
	$url_p = array(
		"namespace" => "",
		"controller" => "sources",
		"action" => "detail",
		"file" => $params["file"]
	);
	$url = Atk14Url::BuildLink($url_p);

	$title = isset($params["title"]) ? $params["title"] : $params["file"];

	$out = "<a href=\"$url\" data-remote=\"true\" data-type=\"" . $params["data_type"] . "\">$title</a>";
	if($params["add_br"]){ $out .= "<br />"; }
	return $out;
}
