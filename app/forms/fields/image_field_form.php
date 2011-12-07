<?php
class ImageFieldForm extends FieldsForm{
	function set_up(){
		$this->enable_file_upload();

		$this->add_field("image",new ImageField(array(

			// "width" => null,
			// "height" => null,
			// "max_width" => null,
			// "max_height" => null,
			// "min_width" => null,
			// "min_height" => null,
		)));
	}
}

