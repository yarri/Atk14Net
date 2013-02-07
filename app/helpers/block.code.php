<?php
function smarty_block_code($params,$content,&$smarty,&$repeat){
	$content = trim($content);
	$content = str_replace("\t","  ",$content);
	return '<pre><code>'.h($content).'</code></pre>';
}
