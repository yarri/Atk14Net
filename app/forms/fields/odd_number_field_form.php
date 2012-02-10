<?php
class OddNumberFieldForm extends ApplicationForm{
	function set_up(){
		$this->set_method("get");

		$this->add_field("number",new OddNumberField(array(
			"label" => "Odd Number"
		)));
	}
}
