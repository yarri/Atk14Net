<?php
class MainController extends ApplicationController{
	function index(){
		$this->page_title = "Welcome";

		// every day a new message
		$this->tpl_data["mod"] = Motd::GetMessage();
	}
}
