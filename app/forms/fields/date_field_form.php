<?php
class DateFieldForm extends ApplicationForm{
	function set_up(){
		$this->set_method("get");
		$this->add_field("date",new DateField(array(
			
		)));
	}
}
