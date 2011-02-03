<?
/**
* The base class for other models.
*/
class ApplicationModel extends inobj_TableRecord{
	function Slugify($text){
		$slug = iconv("UTF-8","ASCII",$text);
		$slug = strtolower($slug);
		$slug = preg_replace("/[^a-z0-9]+/","-",$slug);
		return $slug;
	}
}
