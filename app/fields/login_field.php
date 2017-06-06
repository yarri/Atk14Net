<?php
class LoginField extends RegexField{

	function __construct($options = array()){
		$options += array(
			"min_length" => 2,
			"max_length" => 50,
			"help_text" => "Only letters, numbers, dots and dashes are allowed. Up to 50 characters.",
			"hints" => ["john.doe","samantha92"],
			"check_for_conflicted_user_existence" => true,
		);

		$this->check_for_conflicted_user_existence = $options["check_for_conflicted_user_existence"];
		unset($options["check_for_conflicted_user_existence"]);

		parent::__construct('/^[a-z0-9.-]+$/',$options);

		$this->widget->attrs["pattern"] = '^[a-z0-9.-]+$';
		$this->update_messages([
			"login_taken" => "This username has been already taken",
		]);
	}

	function clean($value){
		list($err,$value) = parent::clean($value);
		if($err || is_null($value)){ return [$err,$value]; }

		if($this->check_for_conflicted_user_existence && User::FindByLogin($value)){
			$err = $this->messages["login_taken"];
			$value = null;
		}

		return [$err,$value];
	}
}
