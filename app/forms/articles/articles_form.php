<?php
class ArticlesForm extends ApplicationForm {
	function set_up(){
		$this->add_field("title", new CharField([
			"max_length" => 255
		]));

		$this->add_field("teaser", new TextField([
			"required" => false,
		]));

		$this->add_field("body", new TextField([
			"help_text" => "Markdown format is required",
		]));

		$this->add_field("author", new CharField([
			"hint" => "John Doe",
		]));

		$this->add_field("published_at", new DateTimeField([
			"initial" => date("Y-m-d H:i"),
		]));
	}
}
