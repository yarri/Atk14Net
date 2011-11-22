<?php
class UsersController extends ApplicationController{

	function create_new(){
		$this->page_title = "Sign Up";
		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$user = User::CreateNewRecord($d);
			$this->_store_login($user);
			$this->flash->notice("The registration has been successfuly realized.");
			$this->_redirect_to("main/index");
		}
	}

	function login(){
		if($this->request->post() && ($d = $this->form->validate($this->params))){
			if(!$this->session->cookiesEnabled()){
				$this->form->set_error("Please, enable cookies in your browser in order to login");
				return;
			}
			if(!$user = User::Login($d["login"],$d["password"])){
				$this->form->set_error("Invalid username or password");
				return;
			}
			$this->_store_login($user);
			$this->flash->notice("You have been succesfully logged in");
			$this->_redirect_to("main/index");
		}
	}

	function logout(){
		$this->session->clear("user_id");
		$this->flash->notice("You have been logged out");
		$this->_redirect_to("main/index");
	}

	// stores logged user id into session
	function _store_login($user){
		$this->session->s("user_id",$user->getId());
	}

	function _before_filter(){
		$this->doc_source_files[] = "app/models/user.php";
	}
}
