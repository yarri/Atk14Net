<?
class User extends ApplicationModel{
	function __construct(){
		parent::__construct("users");
	}

	function GetInstanceByLogin($login){
		return User::FindFirst(array(
			"conditions" => "login=:login",
			"bind_ar" => array(":login" => $login)
		));
	}

	function Login($login,$password){
		if(($user = User::GetInstanceByLogin($login)) && ($user->g("password")==User::CryptPassword($password,$login))){
			return $user;
		}
	}

	function CryptPassword($password,$login){
		return "md5:".md5($password.$login);
	}

	function isAdmin(){ return $this->g("is_admin")=="Y"; }

	function getLogin(){ return $this->g("login"); }
}
