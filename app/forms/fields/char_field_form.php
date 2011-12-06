<?php
class CharFieldForm extends FieldsForm{
	function set_up(){
		$this->set_method("get");

		$this->add_field("value",new CharField(array(
			"label" => "A character value",
			"help_text" => "Write here a character value",
			"hint" => "Lorem Ipsum",
			"min_length" => 2, // def. null
			"max_length" => 20, // def. null

			// "widget" => new TextInput(),
			// "initial" => "",
			// "null_empty_output" => false,
			// "required" => true,
			// "trim_value" => true,
			// "disabled" => false,
		)));
	}
}
