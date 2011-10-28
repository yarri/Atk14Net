<?php
class IndexForm extends ApplicationForm{
	function set_up(){
		$this->set_method("get");
		$this->add_field("search",new CharField(array(
			"required" => false,
			"max_length" => 100,
		)));
	}
}
