<?php
class FileFieldForm extends ApplicationForm{
	function set_up(){
		$this->enable_file_upload();

		$this->add_field("file",new FileField(array(

			// "required" => true
		)));
	}
}
