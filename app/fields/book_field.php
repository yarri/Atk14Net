<?php
class BookField extends ChoiceField{
	function BookField($options = array()){
		$choices = array("" => "-- select a book --");
		foreach(Book::FindAll(array("order_by" => "UPPER(title)")) as $b){
			$choices[$b->getId()] = $b->getTitle();
		}
		
		$options = array_merge(array(
			"choices" => $choices,
		),$options);

		parent::ChoiceField($options);
	}

	/**
	* On the input converts object to its scalar value.
	*/
	function format_initial_data($data){
		return is_object($data) ? $data->getId() : $data;
	}

	/**
	* Cleans the user input.
	* 
	* Cleaned value will be a member of Book class.
	*/
	function clean($value){
		list($err,$value) = parent::clean($value);
		if(isset($err)){ return array($err,null); }

		return array(null,Book::GetInstanceById($value));
	}
}
