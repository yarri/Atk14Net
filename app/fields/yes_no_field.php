<?php
class YesNoField extends BooleanField {
	function YesNoField($options = array()) {
		parent::BooleanField($options);
	}

	function format_initial_data($value) {
		return $value=="Y";
	}

	function clean($value) {
		list($error, $value) = parent::clean($value);
		if (!is_null($error)) { return array($error, null); }
		return array(null, ($value ? "Y" : "N"));
	}
}
