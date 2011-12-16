<?php
class EmailFieldForm extends ApplicationForm{
	function set_up(){
		$this->set_method("get");

		$this->add_field("email",new EmailField(array(
			"label" => "E-mail",
		)));
	}
}
