<?php
class LoginForm extends ApplicationForm{
	function set_up(){
		$this->add_field("login",new CharField(array(
			"title" => _("Login")
		)));

		$this->add_field("password",new PasswordField(array(
			"title" => _("Password"),
		)));
	}
}
