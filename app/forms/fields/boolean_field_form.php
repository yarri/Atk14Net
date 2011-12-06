<?php
class BooleanFieldForm extends FieldsForm{
	function set_up(){
		$this->set_method("get");

		$this->add_field("bool",new BooleanField(array(
			"required" => false,
		)));

		$this->add_field("another_bool",new BooleanField(array(
			"required" => false,
			"widget" => new Select(array(
				"choices" => array(
					"true" => "Yes",
					"false" => "No",
				),
			)),
		)));
	}
}
