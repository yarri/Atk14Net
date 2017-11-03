<?php
class SignUpJsValidationController extends ApplicationController{
	function 	sign_up(){
		$this->page_title = "Sign up procedure with Javascript validation";

		$this->tpl_data["js_validator"] = $jv = $this->form->js_validator();

		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$user = User::CreateNewRecord($d);
			$this->flash->success("Your registration has been realized successfuly!");
			$this->_redirect_to(array(
				"controller" => "main",
			));
		}
	}

	function check_login_availability(){
		$this->response->write(User::FindByLogin($this->params->getString("login")) ? "false" : "true");
		$this->render_template = false;
	}
}
