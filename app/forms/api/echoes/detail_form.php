<?php
class DetailForm extends ApiForm {

	var $has_format_field = false;

	function set_up(){
		$this->add_field("response", new TextField([
			"initial" => "",
			"required" => false, 
		]));
		$this->value_or_initial_fields[] = "response";

		$this->add_field("status_code", new IntegerField([
			"min_value" => 100,
			"max_value" => 599,
			"initial" => 200,
			"required" => false,
		]));
		$this->value_or_initial_fields[] = "status_code";

		$this->add_field("content_type", new CharField([
			"initial" => "text/plain",
			"required" => false,
		]));
	}
}
