<?php
class RemindersController extends ApplicationController {

	function create_new(){
		$this->page_title = "Book returning reminder";

		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$email_src = $this->mailer->send_reminder($d["book"],$d["email_to"]);

			// the following lines display source code of the email just sent...
			$this->render_template = false;
			$this->response->setContentType("text/plain");
			$this->response->write(print_r($email_src,true));

			// $this->flash->success("The reminder has been sent");
			// $this->_redirect_to("reminders/create_new");
		}
	}
	

	function _before_filter(){
		$this->doc_source_files[] = "app/controllers/application_mailer.php";
		$this->doc_source_files[] = "app/views/mailer/send_reminder.tpl";
	}
}
