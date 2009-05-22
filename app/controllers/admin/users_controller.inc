<?
class UsersController extends ApplicationController{
	function overview(){
		$sorting = new Atk14Sorting($this->params);
		$sorting->add("name",array("title" => _("Sort by Name")));
		$sorting->add("login",array("title" => _("Sort by Login")));
		$sorting->add("created_at",array("title" => _("Sort by date of registration")));

		$this->tpl_data["total_amount"] = $this->dbmole->selectSingleValue("SELECT COUNT(*) FROM users");
		$this->tpl_data["max_amount"] = 40;
		$this->tpl_data["users"] = Model::FindAll(array(
			"class_name" => "User",
			"order" => $sorting->getOrder(),
			"limit" => 40,
			"offset" => isset($d["from"]) ? $d["from"] : 0
		));
		$this->tpl_data["sorting"] = $sorting;
	}

	function edit(){
		$user = User::ById($this->params->g("id","integer"));
		$this->form->set_initial($user->getValues());
		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$user->s($d);
			$this->flash->notice(_("The user has been updated successfuly."));
			$this->_redirect_to($this->return_uri);
		}
	}

	function _before_filter(){
		$this->page_title = _("Users");
	}
}
?>
