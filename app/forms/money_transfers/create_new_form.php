<?php
class CreateNewForm extends ApplicationForm{
	function set_up(){
		$this->add_field("amount",new FloatField(array(
			"label" => "Amount of Money",
			"min_value" => 0.1
		)));
		$this->add_field("bank_account",new CharField(array(
			"label" => "Target bank account"
		)));

		$this->enable_csrf_protection(); // this call enables a CSRF protection
	}
}
