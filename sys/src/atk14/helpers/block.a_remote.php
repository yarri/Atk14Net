<?
/**
*/
function smarty_block_a_remote($params, $content, &$smarty, &$repeat)
{
	$attributes = array();

	$params = array_merge(array(
		"_method" => "get"
	),$params);

	$method = strtolower($params["_method"]);
	unset($params["_method"]);

	$url = Atk14Utils::BuildLink($params,$smarty);

	$attrs = Atk14Utils::ExtractAttributes($params);
	$attrs["href"] = $url;
	if(0 && "be_pretty_ugly"){
		$attrs["onclick"] = "$('body').css('cursor','wait'); $.ajax({ type: 'GET', url: $(this).attr('href'), dataType: 'script', complete: function(){ $('body').css('cursor','default'); } }); return false;";
	}elseif(0 && "be_ugly"){
		$attrs["onclick"]= "return parent.remote_link(this);";
	}elseif("be_nice"){
		if(!isset($attrs["class"])){ $attrs["class"] = ""; }
		$_class = $method=="post" ? "remote_post_link" : "remote_link";
		$attrs["class"] = trim("$attrs[class] $_class");
	}

	$attrs = Atk14Utils::JoinAttributes($attrs);

	//$attributes[] = " onclick=\"JavaScript: jQuery.getScript($(this).attr('href')); return false;\"";
	//$attributes[] = " onclick=\"JavaScript: document.body.style.cursor='wait'; $.ajax({type: 'GET', url: $(this).attr('href'), dataType: 'script', complete: function(){ document.body.style.cursor='default'; } }); return false;\"";

	// prepne cursor na wait; provede ajax request; zmeni cursor na default

	return "<a$attrs>$content</a>";
}
?>
