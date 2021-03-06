<?php
class SignUpForm extends ApplicationForm{
	function set_up(){
		/*$this->add_field("login",new LoginField(array(
			"title" => _("Desired username"),
			"min_length" => 2,
		)));*/

		$f = $this->add_field("login",new RegexField("/^[a-z0-9.]{2,6}$/i",array(
			"title" => _("Desired username"),
			"min_length" => 2,
			"max_length" => 10,
		)));
		$f->update_message("invalid","Only letters a..z, 0..9 and dot allowed, up to 6 characters");

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

	function js_validator(){
		$js_v = parent::js_validator();

		$js_v->validators["login"]->add_rule("remote",Atk14Url::BuildLink(array("controller" => "sign_up_js_validation", "action" => "check_login_availability")));
		$js_v->validators["login"]->add_message("remote",_("The login has been already taken"));

		$js_v->validators["password_confirmation"]->add_rule("equalTo","#id_password");
		$js_v->validators["password_confirmation"]->add_message("equalTo",_("Please, enter the same password"));
	
		return $js_v;
	}
}
