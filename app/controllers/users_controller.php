<?php
class UsersController extends ApplicationController{
	function create_new(){
		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$user = User::CreateNewRecord($d);
			$this->_store_login($user);
			$this->flash->notice("The registration has been successfuly realized.");
			$this->_redirect_to(array(
				"controller" => "main",
				"action" => "index"
			));
		}
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

	function logout(){
		$this->session->clear("user_id");
		$this->flash->notice(_("You have been logged out"));
		$this->_redirect_to(array("controller" => "main"));
	}

	function _store_login($user){
		$this->session->s("user_id",$user->getId());
	}

	function _before_filter(){
		$this->doc_source_files[] = "app/models/user.php";
	}
}
