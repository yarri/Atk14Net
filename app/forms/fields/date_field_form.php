<?php
class DateFieldForm extends ApplicationForm{
	function set_up(){
		$initial = date("Y-m-d H:i:s"); // e.g. "2016-01-22 12:30:33"
		$this->add_field("date",new DateField(array(
			"initial" => $initial,
		)));

		$this->add_field("datetime",new DateTimeField(array(
			"initial" => $initial
		)));

		$this->add_field("datetime_sec",new DateTimeWithSecondsField(array(
			"initial" => $initial
		)));
	}
}
