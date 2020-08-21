<?php
/**
 * This is the application mailer class.
 *
 * From a controller you can call mailer`s action this way
 * 
 * 	$this->mailer->send_reminder($book,$email_to);
 *
 */ 
class ApplicationMailer extends Atk14Mailer {

	function send_reminder($book,$email_to){
		$this->from = "Pvt. Vasquez <vasquez@public-library.com>";
		$this->to = $email_to;
		$this->subject = "Book return reminder";

		$this->tpl_data["book"] = $book;

		// the email`s body will be rendered from template views/mailer/send_reminder.tpl

		// some more variables to set
		// $this->cc = "";
		// $this->bcc = "";
		// $this->content_type = "text/plain";
		// $this->content_charset = "UTF-8";

		// sending attachments
		// $this->add_attachment($image_content,"image.jpg","image/jpg");
	}

	/**
	 * A place for common configuration.
	 */
	function _before_filter(){
		$this->from = "info@atk14.net";
	}
}
