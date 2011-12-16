<?php
class MultipleChoiceFieldForm extends ApplicationForm{
	function set_up(){
		$this->set_method("get");
		$this->add_field("colors",new MultipleChoiceField(array(
			"label" => "Colors",
			"choices" => array(
				"red" => "Red",
				"pink" => "Pink",
				"blue" => "Blue",
				"green" => "Green",
				"yellow" => "Yellow",
				"light_gray" => "Light gray",
			),
		)));
	}
}
