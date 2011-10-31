<?php
class CreateNewForm extends ApplicationForm{
	function set_up(){
		$this->add_field("title_cs",new CharField(array(
			"max_length" => 255,
		)));
		$this->add_field("title_en",new CharField(array(
			"max_length" => 255,
		)));
		$this->add_field("info_cs",new CharField(array(
			"widget" => new TextArea(),
			"required" => false,
		)));
		$this->add_field("info_en",new CharField(array(
			"widget" => new TextArea(),
			"required" => false,
		)));
	}
}
