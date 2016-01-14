<?php
class TextFieldForm extends ApplicationForm{
	function set_up(){
		$this->add_field("value",new TextField(array(
			"label" => "Message",
			"help_text" => "Leave a message here",
			"error_messages" => array(
				"required" => "Please, write your message here. Feel free to write anything you want."
			),
			//"hint" => "Lorem Ipsum",

			// "widget" => new Texarea(),
			// "initial" => "",
			// "null_empty_output" => false,
			// "required" => true,
			// "trim_value" => false,
			// "disabled" => false,
		)));
	}
}
