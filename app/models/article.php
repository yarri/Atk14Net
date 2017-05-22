<?php
class Article extends ApplicationModel{

	static function GetInstanceBySlug($slug){
		if(preg_match('/^(\d+)-.*/',$slug,$matches)){ return Article::FindById($matches[1]); }
	}

	/**
	 *	echo $article->getSlug(); // "123-best-article-of-the-year"
	 */
	function getSlug(){
		$title = new String4($this->getTitle());
		return $this->getId()."-".$title->toSlug()->truncate(200,["separator" => "-", "omission" => ""])->toString();
	}
}
