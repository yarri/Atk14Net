<?php
class CsfrProtectedForm extends ApplicationForm{
	function set_up(){
		$this->enable_csfr_protection();

		$this->add_field("name",new CharField(array(
			"label" => "Give me your name",
		)));
	}
}
