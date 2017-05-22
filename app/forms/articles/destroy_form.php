<?php
class DestroyForm extends ApplicationForm {
	function set_up(){
		$this->add_field("confirmation", new ConfirmationField([
			"label" => "Confirm article deletion",
		]));
	}
}
