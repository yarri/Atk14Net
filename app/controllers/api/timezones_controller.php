<?php
class TimezonesController extends ApiController {

	function detail(){
		if($this->params->notEmpty() && ($d = $this->form->validate($this->params))){
			$this->api_data = [
				"timezone" => $d["timezone"],
				"datetime" => date("Y-m-d H:i:s")
			];
		}
	}
}
