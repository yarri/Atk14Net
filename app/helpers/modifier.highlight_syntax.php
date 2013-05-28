<?php
require_once(ATK14_DOCUMENT_ROOT."/lib/geshi/geshi.php");
function smarty_modifier_highlight_syntax($content){
	$language = null;
	if(preg_match('/^\s*<\?php/s',$content)){
		$language = "php";
	}elseif(preg_match('/sql/',$content)){
		$language = "sql";
	}else{
		$language = "smarty";
	}


	if($language){
		$geshi = new GeSHi($content, $language);
		$geshi->set_url_for_keyword_group(3, ""); // we don't want links to PHP functions
		return $geshi->parse_code();
	}

	return h($content);
}
