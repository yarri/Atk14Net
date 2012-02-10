<?php
class FieldsController extends ApplicationController{
	function char_field(){ $this->_validate_form(); }
	function email_field(){ $this->_validate_form(); }
	function date_field(){ $this->_validate_form(); }
	function boolean_field(){ $this->_validate_form(); }
	function multiple_choice_field(){ $this->_validate_form(); }
	function file_field(){
		$this->page_description = "Here is a file upload example.";
		$this->_validate_form();
	}
	function image_field(){ $this->_validate_form(); }
	function odd_number_field(){
		$this->page_description = "OddNumberField is a custom field.";
		$this->doc_source_files[] = "app/fields/odd_number_field.php";
		$this->_validate_form();
	}


	function _validate_form(){
		$this->template_name = "validate_form";
		if(($this->params->notEmpty() || $this->request->post()) && ($d = $this->form->validate($this->params))){
			$this->flash->success("Nice! The form has been validated without an error");
			$this->tpl_data["validated_data"] = $d;
		}

		$this->doc_source_files[] = "app/views/fields/validate_form.tpl";
	}

	function _before_filter(){
		$this->page_description = "";
		$a = new String($this->action);
		$this->page_title = sprintf("%s field example",$a->camelize());
	}
}
