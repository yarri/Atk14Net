<?php
class CsrfProtectedForm extends ApplicationForm{
	function set_up(){
		$this->enable_csrf_protection();

		$this->add_field("name",new CharField(array(
			"label" => "Give me your name",
		)));
	}
}
