<?php
class DetailForm extends ApiForm {

	function set_up(){
		$this->add_field("delay", new IntegerField([
			"min_value" => 0,
			"max_value" => 60,
			"help_text" => _("Delay in seconds"),
		]));
	}
}
