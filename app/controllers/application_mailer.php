<?php
/**
 * This is the application mailer class.
 *
 * From a controller you can call mailer`s action this way
 * 
 *  $this->mailer->extends($action_name,$action_params);
 * 
 * For the only action in this example it should be
 * 
 * 	$this->mailer->execute("send_reminder",array(
 *		"email_to" => "someone@somewhere.com",
 *		"book" => "Adventures of Huckleberry Finn")
 *	);
 */ 
class ApplicationMailer extends Atk14Mailer {
	function send_reminder($params = array()){
		$this->from = 'Pvt. Vasquez <vasquez@public-library.com>';
		$this->to = $params["email_to"];
		$this->subject = "Book return reminder";

		$this->tpl_data["book"] = $params["book"];

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
