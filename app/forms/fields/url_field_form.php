<?php
class UrlFieldForm extends ApplicationForm{
	function set_up(){
		$this->set_method("get");
		$this->add_field("url",new UrlField(array(
			"label" => "URL",
			"hint" => "<br />www.example.com<br />http://www.example.com/<br />https://www.example.com"
		)));
	}
}
