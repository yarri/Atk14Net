<?php
class FormsController extends ApplicationController{

	function csfr_protected(){
		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$this->flash->success(sprintf("You are <em>%s</em> and the form has been sent correctly",h($d["name"])));
		}
	}
}
