<?php
class ArticlesController extends ApplicationController {

	function index(){
		$this->page_title = "Articles";
	
		$this->tpl_data["finder"] = Article::Finder([
			"offset" => $this->params->getInt("offset"),
			"order_by" => "published_at DESC, id DESC"
		]);
	}

	function detail(){
		$article = $this->article;

		$this->page_title = $this->breadcrumbs[] = $article->getTitle();
		$this->description = $article->getTeaser();
	}

	function create_new(){
		$this->page_title = $this->breadcrumbs[] = "Create new article";

		if($this->request->post() && ($d = $this->form->validate($this->params))){
			Article::CreateNewRecord($d);
			$this->flash->success("New article has been created");
			$this->_redirect_to("index");
		}
	}

	function edit(){
		$article = $this->article;

		$this->breadcrumbs[] = [$article->getTitle(),$this->_link_to(["action" => "detail", "id" => $article])];
		$this->page_title = $this->breadcrumbs[] = "Edit article";

		$this->form->set_initial($article);

		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$this->article->s($d);
			$this->flash->success("Changes have been saved");
			$this->_redirect_to(["action" => "detail", "id" => $article]);
		}
	}

	function destroy(){
		$article = $this->article;

		$this->breadcrumbs[] = [$article->getTitle(),$this->_link_to(["action" => "detail", "id" => $article])];
		$this->page_title = $this->breadcrumbs[] = "Delete article";

		if($this->request->post() && $this->form->is_valid($this->params)){
			$article->destroy();
			$this->flash->success("Article has been deleted");
			$this->_redirect_to("index");
		}
	}

	function _before_filter(){
		if(in_array($this->action,["detail","edit","destroy"])){
			$article = Article::FindById($this->params->getInt("id"));
			if(!$article){
				$this->_execute_action("error404");
				return;
			}
			$this->article = $this->tpl_data["article"] = $article;
		}

		if($this->action=="index"){
			$this->breadcrumbs[] = "Articles";
		}else{
			$this->breadcrumbs[] = ["Articles","articles/index"];
		}
	}
}
