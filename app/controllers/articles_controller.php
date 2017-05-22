<?php
class ArticlesController extends ApplicationController {

	function index(){
		$this->page_title = $this->breadcrumbs[] = "Articles";
	
		$this->tpl_data["finder"] = Article::Finder([
			"offset" => $this->params->getInt("offset"),
			"order_by" => "published_at DESC, id DESC"
		]);
	}

	function detail(){
		if(!$article = Article::FindById($this->params->getInt("id"))){
			$this->_execute_action("error404");
			return;
		}

		$this->breadcrumbs[] = ["Articles",$this->_link_to("index")];

		$this->page_title = $this->breadcrumbs[] = $article->getTitle();
		$this->description = $article->getTeaser();

		$this->tpl_data["article"] = $article;
	}
}
