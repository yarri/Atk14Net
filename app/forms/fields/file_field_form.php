<?php
class FileFieldForm extends ApplicationForm{
	function set_up(){
		$this->add_field("file",new FileField(array(

			// "required" => true
		)));
	}
}
