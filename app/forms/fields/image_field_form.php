<?php
class ImageFieldForm extends ApplicationForm{
	function set_up(){
		$this->add_field("image",new ImageField(array(
			"label" => "Image",
			"help_text" => "Expecting jpeg, png or gif file",

			// "width" => null,
			// "height" => null,
			// "max_width" => null,
			// "max_height" => null,
			// "min_width" => null,
			// "min_height" => null,

			// "required" => true,
			// "hint" => "",
		)));
	}
}

