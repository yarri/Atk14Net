<?php
class UsersController extends ApiController {

	/**
	 * ### User registration
	 *
	 * #### HTTP status codes
	 *
	 * * 201 Created
	 * * 409 Conflict: The login name has already been used
	 * * 400 Bad Request: There is a invalid parameter
	 */
	function create_new(){
		if($this->request->post() && ($d = $this->form->validate($this->params))){


			if(User::FindByLogin($d["login"])){
				$this->_report_fail("The login name has already been used",409); // HTTP 409 Conflict
				return;
			}

			unset($d["format"]);
			$user = User::CreateNewRecord($d);

			$this->api_data = $this->_dump_user($user);
		}
	}
}
