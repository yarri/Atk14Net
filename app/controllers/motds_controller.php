<?php
class MotdsController extends ApplicationController{

	/**
	 * Displays current MOTD in plain text format
	 */
	function current(){
		$this->render_template = false;
		$this->response->setContentType("text/plain");
		$this->response->write(Motd::GetMessage());
	}
}
