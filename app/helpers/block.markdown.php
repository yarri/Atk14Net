<?php
require_once(dirname(__FILE__)."/modifier.markdown.php");
function smarty_block_markdown($params,$content,&$smarty,&$repeat){
	if($repeat){ return; }
	return smarty_modifier_markdown($content);
}
