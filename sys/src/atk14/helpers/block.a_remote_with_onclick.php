<?
/**
* Toto je teda pekny hack. Zavedl jsem to ve chvili, kdy jsem z iframe nahrazoval HTML kod ve hlavni strance.
* Pokud byl v tomto novem HTML kodu remote link, livequery nenavesilo automaticky onclick eventy.
* 
* TOTO: Potrebuje refaktoring (sjednotit kod s block.a_remote.php).
*/
function smarty_block_a_remote_with_onclick($params, $content, &$smarty, &$repeat)
{
	$attributes = array();

	$url = Atk14Utils::BuildLink($params,$smarty);

	$attrs = Atk14Utils::ExtractAttributes($params);
	$attrs["href"] = $url;
	if(1 && "be_pretty_ugly"){
		$attrs["onclick"] = "$('body').css('cursor','wait'); $.ajax({ type: 'GET', url: $(this).attr('href'), dataType: 'script', complete: function(){ $('body').css('cursor','default'); } }); return false;";
	}elseif(0 && "be_ugly"){
		$attrs["onclick"]= "alert($(this).attr('href')); return remote_link(this);";
	}elseif("be_nice"){
		if(!isset($attrs["class"])){ $attrs["class"] = ""; }
		$attrs["class"] = trim("$attrs[class] remote_link");
	}

	$attrs = Atk14Utils::JoinAttributes($attrs);

	//$attributes[] = " onclick=\"JavaScript: jQuery.getScript($(this).attr('href')); return false;\"";
	//$attributes[] = " onclick=\"JavaScript: document.body.style.cursor='wait'; $.ajax({type: 'GET', url: $(this).attr('href'), dataType: 'script', complete: function(){ document.body.style.cursor='default'; } }); return false;\"";

	// prepne cursor na wait; provede ajax request; zmeni cursor na default

	return "<a$attrs>$content</a>";
}
?>
