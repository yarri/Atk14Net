<?php
class OddNumberField extends IntegerField{
	function __construct($options = array()){
		parent::__construct($options);
		$this->update_messages(array(
			"not_odd_number" => "Please, enter an odd number"
		));
	}

	function clean($value){
		list($err,$value) = parent::clean($value);
		if($err || is_null($value)){ return array($err,$value); }

		if(abs($value)%2!=1){
			$err = $this->messages["not_odd_number"];
		}

		return array($err,$value);
	}
}
