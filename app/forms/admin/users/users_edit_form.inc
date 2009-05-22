<?
class UsersEditForm extends ApplicationForm{
	function set_up(){
		$this->add_field("login",new CharField(array(
			"title" => _("Login"),
			"disabled" => true,
			"required" => false,
		)));
		$this->add_field("name",new CharField(array(
			"title" => _("Your Name"),
		)));
		$this->add_field("email",new EmailField(array(
			"title" => _("E-mail address")
		)));
		$this->add_field("is_admin",new YesNoField(array(
			"title" => _("Is admin"),
			"required" => false,
		)));
	}
}
?>
