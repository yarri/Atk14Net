<?php
/**
 * Router for ArticlesController
 *
 * Provides nice urls for actions:
 * - articles/index
 * - articles/detail
 *
 * Produces routes like:
 * - /article/
 * - /articles/very-nice-article-123/
 * 
 * czech variants:
 * - /clanky/
 * - /clanek/very-nice-article-123/
 */
class ArticlesRouter extends Atk14Router {
	
	function recognize($uri){
		if(preg_match('/^\/(articles|clanky)\/?$/',$uri,$matches)){ // "http://www.atk14.net/articles/"
			$this->controller = "articles";
			$this->action = "index";
			$this->lang = $matches[1]=="articles" ? "en" : "cs";
			return;
		}

		if(preg_match('/^\/(article|clanek)\/([0-9a-z-]+)\/?$/',$uri,$matches)){ // "http://www.atk14.net/article/atk14-skelet-is-out-2/"
			if(!$article = Article::GetInstanceBySlug($matches[2])){
				$this->_not_found();
				return;
			}

			$this->controller = "articles";
			$this->action = "detail";
			$this->lang = $matches[1]=="article" ? "en" : "cs";

			$this->params->add("id",$article->getId());
		}
	}

	function build(){
		if($this->controller!="articles"){ return; }

		if($this->action=="index"){
			return $this->lang=="en" ? "/articles/" : "/clanky/";
		}

		if($this->action=="detail" && ($article = Article::GetInstanceById($this->params->getInt("id")))){
			$this->params->del("id");
			$prefix = $this->lang=="en" ? "article" : "clanek";
			return "/$prefix/".$article->getSlug()."/";
		}
	}
}
