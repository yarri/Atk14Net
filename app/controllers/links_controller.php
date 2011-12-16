<?php
class LinksController extends ApplicationController{
	function index(){
		$this->page_tilte = "Links";
	}

	function some_post_action(){
		if(!$this->request->post()){ return $this->_execute_action("error404"); }
		$this->page_title = "POST action";
	}
}
