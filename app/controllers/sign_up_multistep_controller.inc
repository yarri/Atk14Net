<?
class SignUpMultistepController extends ApplicationController{
	function sign_up(){
		$this->_walk(array(
			"get_data",
			"legal_agreements",
			"create_record",
			"done",
		));
	}

	// notice 2 underscores in a step method name
	function sign_up__get_data(){
		return $this->request->post() && $this->form->validate($this->params);	
	}

	function sign_up__legal_agreements(){
		return $this->request->post();
	}

	function sign_up__create_record(){
		// in a step method you have access to previous steps form data
		return User::CreateNewRecord($this->form_data["get_data"]);
	}

	function sign_up__done(){
		// through $this->returned_by you have access to returned values of all previous steps
		$this->tpl_data["just_registered_user"] = $this->returned_by["create_record"];
		
		// this is the very last step, so don't return non-false value
	}
}
