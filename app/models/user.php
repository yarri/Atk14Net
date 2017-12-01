<?php
class User extends ApplicationModel{

	/**
	 * Returns user when a correct combination of login and password is given.
	 * 
	 * $user = User::Login("rambo","secret"); // returns user when login and password are correct
	 */
	static function Login($login,$password,&$bad_password = false){
		$bad_password = false;
	  $user = User::FindByLogin($login);
		if(!$user){ return; }
	  if($user->isPasswordCorrect($password)){
			return $user;
		}
		$bad_password = true;
	}

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

	function isPasswordCorrect($password){
		return MyBlowfish::CheckPassword($password,$this->getPassword());
	}
	
	function toString(){ return $this->getName(); }
}
