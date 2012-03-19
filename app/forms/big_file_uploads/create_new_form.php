<?php
class CreateNewForm extends ApplicationForm{
	function set_up(){
		$this->allow_file_upload();

		$this->add_field("file",new FileField(array(
			"label" => "a Big File",
		)));
	}
}
