<?php
class DelayedResponsesController extends ApiController {

	/**
	 * ### Simulates delayed response
	 *
	 */
	function detail(){
		if(!$this->params->isEmpty() && ($d = $this->form->validate($this->params))){
			sleep($d["delay"]);
			$this->api_data = [];
		}
	}
}
