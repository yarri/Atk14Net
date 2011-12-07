<?php
class FileFieldForm extends FieldsForm{
	function set_up(){
		$this->enable_file_upload();

		$this->add_field("file",new FileField(array(

			// "required" => true
		)));
	}
}
