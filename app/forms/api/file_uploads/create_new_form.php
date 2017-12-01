<?php
class CreateNewForm extends ApiForm {

	function set_up(){
		$this->add_field("file", new FileField(array(
			"max_file_size" => "5M",
			"help_text" => "Maximum allowed file size is 5MB"
		)));
	}
}
