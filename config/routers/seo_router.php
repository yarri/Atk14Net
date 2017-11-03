<?php
class SeoRouter extends Atk14Router {

	function setUp(){
		$this->addRoute("/rss/motds/","en/rss/motds");

		$this->addRoute("/about/","en/main/about");

		$this->addRoute("/snippet/<id>/",array(
			"path" => "en/snippets/detail",
			"params" => array(
				"id" => '/[a-z0-9_]+/'
			),
		));
	}
}
