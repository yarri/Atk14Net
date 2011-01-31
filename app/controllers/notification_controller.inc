<?
class NotificationController extends ApplicationController {
	function remind_member() {
		if ($this->request->post()) {
			$this->mailer->execute("send_reminder");
		}
	}
}

/**
 * Create file application_mailer containing single class ApplicationMailer.
 * This demonstration class must have different name due to inability of the script displaying some explaining informations.
 *
 * Next, you need a template named after the method, ie. send_reminder.tpl which is placed in folder 'mailer'. The template contains body of the email.
 * By setting the $content_type variable you can control format of the email.
 */
class DemoApplicationMailer extends Atk14Mailer {
	function send_reminder($params=array()) {
		$this->from = "info@atk14.net";
		$this->to = "bad_member@domain.org";
		$this->subject = "Book return reminder";
		$this->content_type = "text/plain";
	}
}
?>
