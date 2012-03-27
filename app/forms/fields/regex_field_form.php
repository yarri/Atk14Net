<?php
class RegexFieldForm extends ApplicationForm{
	function set_up(){
		$this->set_method("get");

		$field = $this->add_field("slug", new RegexField('/^([a-z0-9]+-)*[a-z0-9]+$/',array(
			"max_length" => 255,
			"help_text" => "Write down something that looks like a slug for an URL",
			"hint" => "the-brown-fox-blogging" 
		)));

		$field->update_message("invalid","This doesn't look like a slug");
	}
}
