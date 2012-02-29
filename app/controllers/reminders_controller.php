<?php
class RemindersController extends ApplicationController {
	function create_new(){
		$this->page_title = "Book returning reminder";


		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$email_src = $this->mailer->execute("send_reminder",$d);

			// following lines display source code of just sent e-mail...
			$this->render_template = false;
			$this->response->setContentType("text/plain");
			$this->response->write(print_r($email_src,true));

			// more meaningful conclusion may be like
			// $this->flash->success("The reminder has been sent");
			// $this->_redirect_to("main/index");
		}
	}
	

	function _before_filter(){
		$this->doc_source_files[] = "app/controllers/application_mailer.php";
		$this->doc_source_files[] = "app/views/mailer/send_reminder.tpl";
	}
}
