<?php
class CreateNewForm extends ApplicationForm{
	function set_up(){
		$this->add_field("email_to",new EmailField());
		$this->add_field("book",new BookField());
	}
}
