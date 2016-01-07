<?php
class ChoiceFieldForm extends ApplicationForm{
	function set_up(){
		$this->set_method("get");

		$this->add_field("occupation",new ChoiceField(array(
			"label" => "Occupation",
			"choices" => array(
				"" => "-- select occupation --",
				"gardener" => "Gardener",
				"architect" => "Architect",
				"painter" => "Fine artist",
				"none" => "none of above"
			),
			// "widget" => new Select(), // this is the default widget
		)));

		$this->add_field("gender",new ChoiceField(array(
			"choices" => array(
				"female" => "Female",
				"male" => "Male",
				"uncertain" => "I'm not sure",
			),
			"widget" => new RadioSelect(),
		)));
	}
}
