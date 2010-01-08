<?
class SignUpController extends ApplicationController{
	function 	sign_up(){
		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$user = User::CreateNewRecord($d);
			$this->flash->success("Your registration has been realized successfuly!");
			$this->_redirect_to(array(
				"controller" => "main",
			));
		}
	}
}
