<?php
class UrlField extends RegexField{
	function UrlField($options = array()){
		parent::RegexField("/^https?:\\/\\/[a-z0-9.-]+(|:[0-9]{1,6}).*$/i",$options);
		$this->update_messages(array(
			"invalid" => _("Toto nevypadá jako adresa URL"),
		));
	}
	function clean($value){
		$value = trim($value);
		if(strlen($value) && !preg_match("/^https?:\\/\\//i",$value)){
			$value = "http://$value";
		}
		if(preg_match("/^https?:\\/\\/[a-z0-9.-]+(|:[0-9]{1,6})$/",$value)){ $value = "$value/"; }
		return parent::clean($value);
	}
}
