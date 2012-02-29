<?php
class ApplicationMailer extends Atk14Mailer {
	function send_reminder($params=array()) {
		$this->from = "info@atk14.net";
		$this->to = $params["email_to"];
		$this->subject = "Book return reminder";
		// $this->cc = "";
		// $this->bcc = "";
		// $this->content_type = "text/plain";
		// $this->content_charset = "UTF-8";

		$this->tpl_data["book"] = $params["book"];
	}
}
