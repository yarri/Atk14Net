<?php
class CreateNewForm extends ApplicationForm{
	function set_up(){
		$this->add_field("login",new LoginField(array(
			"title" => "Desired username",
		)));
		$this->add_field("password",new PasswordField(array(
			"title" => "Desired password",
		)));
		$this->add_field("password_confirmation",new PasswordField(array(
			"title" => "Confirm password",
		)));
		$this->add_field("name",new CharField(array(
			"title" => "Your Name",
			"min_length" => 2,
			"max_length" => 255
		)));
		$this->add_field("email",new EmailField(array(
			"title" => "E-mail address"
		)));
	}

	function clean(){
		$d = $this->cleaned_data;

		if(isset($d["login"]) && User::FindByLogin($d["login"])){
			$this->set_error("login","The given username has been already taken");
		}

		if(isset($d["password"]) && isset($d["password_confirmation"]) && $d["password"]!=$d["password_confirmation"]){
			$this->set_error("password_confirmation","Passwords are not equals");
		}

		unset($d["password_confirmation"]);

		return array(null,$d);
	}
}
