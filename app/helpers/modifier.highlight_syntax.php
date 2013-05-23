<?php
function smarty_modifier_highlight_syntax($content){
	if(preg_match('/^\s*<\?php/s',$content)){
		return highlight_string($content);
	}
	return h($content);
}
