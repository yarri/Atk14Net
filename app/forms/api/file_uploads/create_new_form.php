<?php
class CreateNewForm extends ApiForm {

	function set_up(){
		$this->add_field("file", new FileField(array(
			"max_file_size" => "12M",
			"help_text" => "Maximum allowed file size is 12MB"
		)));
	}
}
