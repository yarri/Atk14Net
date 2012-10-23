<?php
class LinksController extends ApplicationController{
	function index(){
		$this->page_title = "Examples of building links";

		$this->tpl_data["link_built_in_controller"] = $this->_link_to(array("controller" => "main"));
	}

	function some_post_action(){
		if(!$this->request->post()){ return $this->_execute_action("error404"); }
		$this->page_title = "POST action";
	}
}
