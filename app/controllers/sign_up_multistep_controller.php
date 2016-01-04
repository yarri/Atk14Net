<?php
class SignUpMultistepController extends ApplicationController{
	function sign_up(){
		$this->page_title = "Multi step Sign up procedure";
		$this->page_description = "Example of a multi step Sign up procedure.";

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
		return $this->request->post() && $this->form->validate($this->params);
	}

	function sign_up__create_record(){
		// in a step method you can access any previous step form data
		return User::CreateNewRecord($this->form_data["get_data"]);
	}

	function sign_up__done(){
		// through $this->returned_by you can access returned values of any previous step
		$this->tpl_data["just_registered_user"] = $this->returned_by["create_record"];
		
		// this is the very last step, so don't return non-false value
	}
}
