<?
class ApplicationMailer extends Atk14Mailer {
	function send_reminder($params=array()) {
		$this->from = "info@atk14.net";
		$this->to = "bad_member@domain.org";
		$this->subject = "Book return reminder";
	}
}
?>
