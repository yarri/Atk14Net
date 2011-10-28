<?
class UsersController extends ApplicationController{
	function signup(){
		$this->tpl_data["js_validator"] = $jv = $this->form->js_validator();
		//var_dump($jv->get_rules());
		//var_dump($jv->get_messages());
		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$user = User::CreateNewRecord($d);
			$this->_store_login($user);
			$this->flash->notice("The registration has been successfuly realized.");
			$this->_redirect_to(array(
				"controller" => "main",
				"action" => "index"
			));
		}
	//	var_dump($this->form->js_validation_data(array("return" => "array")));
	}

	function login(){
		if($this->request->post() && ($d = $this->form->validate($this->params))){
			if(!$this->session->cookiesEnabled()){
				$this->form->set_error(_("Please, enable cookies in your browser in order to login"));
				return;
			}
			if($user = User::Login($d["login"],$d["password"])){
				$this->_store_login($user);
				$this->flash->notice(_("You have been succesfully logged in"));
				$this->_redirect_to(array("controller" => "main"));
			}else{
				$this->form->set_error(_("Invalid username or password"));
			}
		}
	}

	// Action for JS validator
	function check_login_availability(){
		$this->response->write(User::GetInstanceByLogin($this->params->g("login","string")) ? "false" : "true");
		$this->render_template = false;
	}

	function logout(){
		$this->session->clear("user_id");
		$this->flash->notice(_("You have been logged out"));
		$this->_redirect_to(array("controller" => "main"));
	}

	function _store_login($user){
		$this->session->s("user_id",$user->getId());
	}

	function _before_filter(){
		$this->doc_source_files[] = "models/user.php";
	}
}
