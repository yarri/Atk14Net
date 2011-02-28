<?php
class RemindersController extends ApplicationController {
	function create_new(){
		$this->doc_source_files[] = "controllers/application_mailer.inc";
		$this->doc_source_files[] = "views/mailer/send_reminder.tpl";

		$this->page_title = "Book returning reminder";


		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$email_src = $this->mailer->execute("send_reminder",$d);

			$this->render_template = false;
			$this->response->setContentType("text/plain");
			$this->response->write(print_r($email_src,true));
		}
	}
}
