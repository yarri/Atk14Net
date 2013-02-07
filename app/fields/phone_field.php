<?php
class PhoneField extends RegexField{
	function PhoneField($options = array()){
		$options = array_merge(array(
			"error_message" => _("Enter valid phone number (+420.605123456)"),
			"null_empty_output" => true,
			"help_text" => _("Expecting number format is +420.605123456"),
		),$options);
		// TODO: jsou cisla, ktera zacinaji nulou: +044.1425838079
		parent::RegexField("/^\\+[1-9][0-9]{1,3}\\.[0-9]{6,12}$/",$options);
	}
	function clean($value){
		$value = preg_replace("/\\s/","",$value);
		if(preg_match("/^[0-9]{9}$/",$value)){
			$value = "+420.$value";
		}
		// +420605123456 -> +420.605123456
		if(preg_match('/^\+420([0-9]{9})$/',$value,$matches)){
			$value = "+420.$matches[1]";
		}
		return parent::clean($value);
	}
}
