<?php
class CreateNewForm extends ApplicationForm{

	function set_up(){
		$this->add_field("login",new LoginField([
			"title" => "Desired username",
		]));
		$this->add_field("password",new PasswordField([
			"title" => "Desired password",
		]));
		$this->add_field("password_confirmation",new PasswordField([
			"title" => "Confirm password",
		]));
		$this->add_field("name",new CharField([
			"title" => "Your Name",
			"min_length" => 2,
			"max_length" => 255
		]));
		$this->add_field("email",new EmailField([
			"title" => "E-mail address"
		]));

		$this->set_method("post"); // default is "post"
		$this->set_attr("novalidate","novalidate"); // <form novalidate="novalidate"></form>
	}

	function clean(){
		list($err,$data) = parent::clean();

		if(isset($data["login"]) && User::FindByLogin($data["login"])){
			$this->set_error("login","The given username has been already taken");
		}

		if(isset($data["password"]) && isset($data["password_confirmation"]) && $data["password"]!==$data["password_confirmation"]){
			$this->set_error("password_confirmation","Passwords are not equals");
		}

		// We do not need password_confirmation in the cleaned data
		unset($data["password_confirmation"]);

		return [$err,$data];
	}
}
