<?php
class ApplicationMailer extends Atk14Mailer {
	function send_reminder($params=array()) {
		$this->from = "info@atk14.net";
		$this->to = $params["email_to"];
		$this->subject = "Book return reminder";
		$this->tpl_data["book"] = $params["book"];
	}
}
