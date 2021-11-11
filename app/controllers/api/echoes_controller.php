<?php
class EchoesController extends ApiController {

	/**
	 * ### Renders response by your needs
	 */
	function detail(){
		if(!$this->params->isEmpty() && ($d = $this->form->validate($this->params))){
			$this->_report_success([],[
				"raw_data" => $d["response"],
				"status_code" => $d["status_code"],
				"content_type" => $d["content_type"],
			]);
		}
	}
}
