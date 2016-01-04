<?php
class LegalAgreementsForm extends ApplicationForm{
	function set_up(){
		$this->add_field("confirm",new BooleanField(array(
			"label" => "I agree",
		)));
	}

	function clean(){
		list($err,$d) = parent::clean();

		if(!$d["confirm"]){
			$this->set_error("Please, check the checkbox");
		}

		return array($err,$d);
	}
}
