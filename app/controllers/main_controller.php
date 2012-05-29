<?php
class MainController extends ApplicationController{
	function index(){
		$this->page_title = "PHP Framework";

		// every day a new message
		$this->tpl_data["mod"] = Motd::GetMessage();
	}
}
