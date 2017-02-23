<?php
class FieldsController extends ApplicationController{
	function index(){
		$this->page_title = "List of Form's fields";
		$this->breadcrumbs[] = "Fields";
	}

	function char_field(){ }
	function text_field(){ }
	function email_field(){}
	function date_field(){ }
	function boolean_field(){}
	function choice_field(){
		$this->page_description = "Here you can see two Choice fields with different widgets - Select and RadioSelect.";
	}
	function multiple_choice_field(){
		$this->page_description = "Here you can see two MultipleChoice fields with different widgets - SelectMultiple and CheckboxSelectMultiple.";
	}
	function regex_field(){ }
	function file_field(){
		$this->page_description = "Here is a file upload example.";
	}
	function image_field(){ }

	function odd_number_field(){
		$this->page_description = "OddNumberField is a custom field.";
		$this->doc_source_files[] = "app/fields/odd_number_field.php";
	}

	function url_field(){
		$this->page_description = "UrlField is a custom field.";
		$this->doc_source_files[] = "app/fields/url_field.php";
	}

	function _validate_form(){
		$this->template_name = "validate_form";
		if((($this->form->get_method()=="get" && $this->params->notEmpty()) || ($this->form->get_method()=="post" && $this->request->post())) && ($d = $this->form->validate($this->params))){
			$this->flash->success("Brilliant! The form has been validated without an error");
			$this->tpl_data["validated_data"] = $d;
		}

		$smarty = $this->_get_smarty();
		if($smarty->templateExists("_$this->action.tpl")){ // "_date_field.tpl"
			$this->tpl_data["long_description"] = $this->_render(array("partial" => "$this->action"));
		}

		$this->doc_source_files[] = "app/views/fields/validate_form.tpl";
		$this->breadcrumbs[] = array("Fields",$this->_link_to(array("action" => "fields/index")));
		$this->breadcrumbs[] = String4::ToObject($this->action)->camelize();
	}

	function _before_filter(){
		$this->page_description = "";
		$a = new String4($this->action);
		$this->page_title = sprintf("%s example",$a->camelize()); // "EmailField usage"
		$this->page_description = sprintf("%s usage example",$a->camelize()); // "Example of the EmailField usage"
	}

	function _before_render(){
		if($this->action!="index"){
			$this->_validate_form();
		}
		parent::_before_render();
	}
}
