<?php
class ConfirmationField extends BooleanField {

	function __construct($options = []){
		parent::__construct($options);

		$this->update_message("required","Check the checkbox");
	}

	function clean($value){
		list($err,$value) = parent::clean($value);

		if(isset($err) || is_null($value)){
			return [$err,$value];
		}

		if(!$value){
			return [$this->messages["required"],null];
		}
		
		return [$err,$value];
	}

}
