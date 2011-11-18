<?php
class FieldsController extends ApplicationController{
	function email(){ $this->_validate_form(); }
	function date(){ $this->_validate_form(); }
	function boolean(){ $this->_validate_form(); }
	function multiple_choice(){ $this->_validate_form(); }


	function _validate_form(){
		$this->template_name = "validate_form";
		if($this->params->notEmpty() && ($d = $this->form->validate($this->params))){
			// ok, the form is valid
			$this->flash->success("Nice! The form has been validated without an error");
			$this->tpl_data["validated_data"] = $d;
		}

		$this->doc_source_files[] = "app/views/fields/validate_form.tpl";
	}

	function _before_filter(){
		$a = new String($this->action);
		$this->page_title = sprintf("%s field example",$a->camelize());
	}
}
