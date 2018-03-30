<?php
class DetailForm extends ApiForm {
	
	function set_up(){
		$this->add_field("requested_response_code", new IntegerField([
			"required" => false,
			"min_value" => 200,
			"max_value" => 999,
		]));
	}
}
