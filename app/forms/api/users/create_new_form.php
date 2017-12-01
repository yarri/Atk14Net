<?php
class CreateNewForm extends ApiForm {

	function set_up(){
		$this->add_field("login", new LoginField(array(
			"check_for_conflicted_user_existence" => false, // this check is provided by the controller
		)));

		$this->add_field("name", new CharField(array(
			"max_length" => 255,
		)));

		$this->add_field("email", new EmailField(array(
			"max_length" => 255,
		)));

		$this->add_field("password", new PasswordField(array(
			"max_length" => 255,
		)));
	}
}
