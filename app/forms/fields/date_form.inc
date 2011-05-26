<?php
class DateForm extends FieldsForm{
	function set_up(){
		$this->add_field("date",new DateField(array(
			
		)));
	}
}
