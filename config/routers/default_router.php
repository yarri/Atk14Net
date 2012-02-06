<?php
class DefaultRouter extends Atk14StaticRouter{

	var $namespace = "";
	
	function setUp(){

		$this->addRoute("/",array(
			"lang" => $this->default_lang,
			"path" => "main/index",
			"title" => ATK14_APPLICATION_NAME,
			"description" => _("The ATK14 Project website; ATK14 is a PHP framework for fearless guys"),
		));

		$this->addRoute("/<lang>/",array(
			"path" => "main/index"
		));

		$this->addRoute("/<lang>/<controller>/",array(
			"action" => "index"
		));

		$this->addRoute("/<lang>/<controller>/<action>/");
	}
}
