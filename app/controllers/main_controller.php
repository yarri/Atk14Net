<?php
require(dirname(__FILE__)."/../../lib/markdown/Michelf/Markdown.php"); // TODO: this needs to be loaded by class_autoload()

class MainController extends ApplicationController{
	function index(){
		// every day a new message
		$this->tpl_data["mod"] = Motd::GetMessage();
	}

	function about(){
		$this->page_title = "About";
		$this->tpl_data["text"] = Michelf\Markdown::defaultTransform(Files::GetFileContent(dirname(__FILE__)."/../../atk14/README.md"));
	}
}
