<?
class Model extends inobj_TableRecord{
	var $lang = "en";

	function Langify($obj,$lang = null){
		if(!isset($lang)){ $lang = "en"; }
		if(is_array($obj)){
			foreach($obj as $k => $o){
				$obj[$k] = Model::Langify($o,$lang);
			}
		}elseif(is_object($obj)){
			$obj->lang = $lang;
		}
		return $obj;
	}

	function slugify($text){
		$slug = iconv("UTF-8","ASCII",$text);
		$slug = strtolower($slug);
		$slug = preg_replace("/[^a-z0-9]+/","-",$slug);
		return $slug;
	}
}
?>
