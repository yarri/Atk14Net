<?php
class User extends ApplicationModel{

	/**
	 * During a new user creation it provides transparent password hashing when it's needed
	 *
	 *		$user = User::CreateNewRecord(array(
	 *			"login" => "rambo",
	 *			"password" => "secret123"
	 *		));
	 */
	static function CreateNewRecord($values,$options = array()){
		if(!MyBlowfish::IsHash($values["password"])){
			$values["password"] = MyBlowfish::GetHash($values["password"]);
		}
		return parent::CreateNewRecord($values,$options);
	}

	/**
	 * It provides transparent password hashing during setting new values
	 *
	 *		$rambo->setValues(array("password" => "newModelArmy"));
	 */
	function setValues($values,$options = array()){
		if(isset($values["password"]) && !MyBlowfish::IsHash($values["password"])){
			$values["password"] = MyBlowfish::GetHash($values["password"]);
		}
		return parent::setValues($values,$options);
	}
	
	/**
	 * Returns user when a correct combination of login and password is given.
	 *
	 *		$user = User::Login("rambo","secret123");
	 */
	static function Login($login,$password){
		$user = User::FindByLogin($login);
		if(!$user){ return; }
		if(MyBlowfish::CheckPassword($password,$user->getPassword())){
			return $user;
		}
	}

	function isAdmin(){ return $this->getIsAdmin()=="Y"; }
}
