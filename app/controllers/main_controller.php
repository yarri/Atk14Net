<?php
class MainController extends ApplicationController{
	function index(){
		// every day a new message
		$this->tpl_data["mod"] = Motd::GetMessage();
	}

	function about(){
		$this->page_title = $this->breadcrumbs[] = "About";
		$this->tpl_data["text"] = Files::GetFileContent(dirname(__FILE__)."/../../atk14/README.md");
	}
}
