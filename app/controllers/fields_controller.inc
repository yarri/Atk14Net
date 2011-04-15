<?php
class FieldsController extends ApplicationController{
	function email(){
		$this->page_title = "E-mail field example";
		$this->_validate_form();
	}

	function _validate_form(){
		$this->template_name = "validate_form";
		if($this->params->notEmpty() && ($d = $this->form->validate($this->params))){
			// ok, the form is valid
			$this->flash->success("Nice! The form has been validated without an error");
			$this->tpl_data["validated_data"] = $d;
		}

		$this->doc_source_files[] = "views/fields/validate_form.tpl";
	}
}
