<?php
/**
 * Router for ArticlesController
 *
 * Provides nice urls for:
 * - articles/index
 * - articles/detail
 */
class ArticlesRouter extends Atk14Router {
	
	function recognize($uri){
		if(preg_match('/^\/articles\/?$/',$uri)){ // "http://www.atk14.net/articles/"
			$this->controller = "articles";
			$this->action = "index";
			return;
		}

		if(preg_match('/^\/article\/([0-9a-z-]+)\/?$/',$uri,$matches)){ // "http://www.atk14.net/article/2-atk14-skelet-is-out/"
			if(!$article = Article::GetInstanceBySlug($matches[1])){
				$this->_not_found();
				return;
			}

			$this->controller = "articles";
			$this->action = "detail";

			$this->params->add("id",$article->getId());
		}
	}

	function build(){
		if($this->controller!="articles"){ return; }

		if($this->action=="index"){
			return "/articles/";
		}

		if($this->action=="detail" && ($article = Article::GetInstanceById($this->params->getInt("id")))){
			$this->params->del("id");
			return "/article/".$article->getSlug()."/";
		}
	}
}
