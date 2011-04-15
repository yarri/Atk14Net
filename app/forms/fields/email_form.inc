<?php
class EmailForm extends FieldsForm{
	function set_up(){
		$this->add_field("email",new EmailField(array(
			"label" => "E-mail",
		)));
	}
}
