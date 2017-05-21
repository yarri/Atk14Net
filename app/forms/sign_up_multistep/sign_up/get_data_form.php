<?php
class GetDataForm extends ApplicationForm{
	function set_up(){
		$this->add_field("login",new CharField(array(
			"title" => _("Desired username"),
			"min_length" => 2,
		)));
		$this->add_field("password",new PasswordField(array(
			"title" => _("Desired password"),
		)));
		$this->add_field("password_confirmation",new PasswordField(array(
			"title" => _("Confirm password"),
		)));
		$this->add_field("name",new CharField(array(
			"title" => _("Your Name"),
			"min_length" => 2,
			"max_length" => 255
		)));
		$this->add_field("email",new EmailField(array(
			"title" => _("E-mail address")
		)));
	}

	function clean(){
		$d = &$this->cleaned_data;

		if(isset($d["login"]) && User::FindByLogin($d["login"])){
			$this->set_error("login",_("The given username has already been taken"));
		}

		if(isset($d["password"]) && isset($d["password_confirmation"]) && $d["password"]!=$d["password_confirmation"]){
			$this->set_error("password_confirmation",_("Passwords are not equals"));
		}

		unset($d["password_confirmation"]);

		return array(null,$d);
	}

}
