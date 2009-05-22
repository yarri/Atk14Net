<?
/**
* {dump var=$basket->getTotalPrice()}
*/
function smarty_function_dump($params,&$smarty){
	$out = print_r($params["var"],true);
	return "<pre>".strtr($out,array("<" => "&lt;",">" => "&gt;"))."</pre>";
}
?>
