<?php
class UsersController extends ApiController {

	/**
	 * ### User registration
	 *
	 */
	function create_new(){
		if($this->request->post() && ($d = $this->form->validate($this->params))){


			if(User::FindByLogin($d["login"])){
				$this->_report_fail("The login has been already taken",409); // HTTP 409 Conflict
			}

			unset($d["format"]);
			$user = User::CreateNewRecord($d);

			$this->api_data = $this->_dump_user($user);
		}
	}
}
