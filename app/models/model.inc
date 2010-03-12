<?
/**
* The base class for other models.
*/
class Model extends inobj_TableRecord{
	function slugify($text){
		$slug = iconv("UTF-8","ASCII",$text);
		$slug = strtolower($slug);
		$slug = preg_replace("/[^a-z0-9]+/","-",$slug);
		return $slug;
	}
}
