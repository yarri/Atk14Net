<?php
require_once(dirname(__FILE__)."/modifier.highlight_syntax.php");
function smarty_block_code($params,$content,&$smarty,&$repeat){
	if($repeat){ return; }
	$content = trim($content);
	$content = str_replace("\t","  ",$content);
	return '<pre><code>'.smarty_modifier_highlight_syntax($content).'</code></pre>';
}
