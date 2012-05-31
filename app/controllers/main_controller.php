<?php
class MainController extends ApplicationController{
	function index(){
		// every day a new message
		$this->tpl_data["mod"] = Motd::GetMessage();
	}
}
