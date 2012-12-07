<?php
class User extends ApplicationModel{

	static function CreateNewRecord($values,$options = array()){
		$values["password"] = User::CryptPassword($values["password"],$values["login"]);
		return parent::CreateNewRecord($values,$options);
	}

	static function GetInstanceByLogin($login){
		return User::FindFirst(array(
			"conditions" => array("login" => $login)
		));
	}

	static function Login($login,$password){
		if(($user = User::GetInstanceByLogin($login)) && ($user->g("password")==User::CryptPassword($password,$login))){
			return $user;
		}
	}

	static function CryptPassword($password,$login){
		return "md5:".md5($password.$login.SECRET_TOKEN);
	}

	function isAdmin(){ return $this->getIsAdmin()=="Y"; }
}
