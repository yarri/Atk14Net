<?
class User extends inobj_TableRecord{
	function User(){
		parent::inobj_TableRecord("users");
	}

	function CreateNewRecord($values){
		$values["password"] = User::CryptPassword($values["password"],$values["login"]);
		return inobj_TableRecord::_CreateNewRecord("User",$values);
	}

	function GetInstanceById($id){
		return inobj_TableRecord::_GetInstanceById("User",$id);
	}

	function GetInstanceByLogin($login){
		return inobj_TableRecord::FindFirst(array(
			"class_name" => "User",
			"conditions" => "login=:login",
			"bind_ar" => array(":login" => $login)
		));
	}

	function Login($login,$password){
		if(($user = User::ByLogin($login)) && ($user->g("password")==User::CryptPassword($password,$login))){
			return $user;
		}
	}

	function CryptPassword($password,$login){
		return "md5:".md5($password.$login);
	}

	function isAdmin(){ return $this->g("is_admin")=="Y"; }

	function getLogin(){ return $this->g("login"); }
}
?>
