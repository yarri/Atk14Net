<?php
class DetailForm extends TimezonesForm {

	function set_up(){
		$this->add_field("timezone", new ChoiceField(([
			"choices" => [
				"Europe/Prague" => "Europe/Prague",
			],
		])));
	}
}
