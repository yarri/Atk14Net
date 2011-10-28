<?php
class CreateNewForm extends ApplicationForm{
	function set_up(){
		$this->add_field("title",new CharField(array(
			"max_length" => 255,
		)));
		$this->add_field("author",new CharField(array(
			"max_length" => 255,
		)));
		$this->add_field("code",new CharField(array(
			"label" => "Book Code",
			"max_length" => 255,
		)));
		$this->add_field("shelfmark",new CharField(array(
			"label" => "Shelf mark",
			"max_length" => 255,
		)));
	}
}
