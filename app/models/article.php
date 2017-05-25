<?php
class Article extends ApplicationModel{

	static function GetInstanceBySlug($slug){
		if(preg_match('/^.*-(\d+)/',$slug,$matches)){ return Article::FindById($matches[1]); }
	}

	/**
	 *	echo $article->getSlug(); // "best-article-of-the-year-1234"
	 */
	function getSlug(){
		$title = new String4($this->getTitle());
		$slugged_title = $title->toSlug()->truncate(200,["separator" => "-", "omission" => ""])->toString();
		if(!$slugged_title){
			// hmm.. I wonder why? :)
			$slugged_title = "very-nice-article";
		}
		$id = $this->getId();
		return "$slugged_title-$id";
	}
}
