<?php
class MultipleChoiceFieldForm extends ApplicationForm{
	function set_up(){
		$this->set_method("get");

		$this->add_field("colors",new MultipleChoiceField(array(
			"label" => "You favourite colors",
			"choices" => array(
				"red" => "Red",
				"pink" => "Pink",
				"blue" => "Blue",
				"green" => "Green",
				"yellow" => "Yellow",
				"light_gray" => "Light gray",
				"other" => "none of listed"
			),
			// "widget" => new SelectMultiple(), // the default widget
		)));

		$this->add_field("interests",new MultipleChoiceField(array(
			"label" => "You interests",
			"choices" => array(
				"computers" => "Computers",
				"gaming" => "Gaming",
				"programming" => "Programming",
				"other" => "other"
			),
			"widget" => new CheckboxSelectMultiple(),
		)));

		$this->set_hidden_field("sent","1"); // just for check that the form is submitted
	}
}
