<?
class User extends Model{
	function User(){
		parent::Model("users");
	}

	function CreateNewRecord($values){
		$values["password"] = User::CryptPassword($values["password"],$values["login"]);
		return Model::_CreateNewRecord("User",$values);
	}

	function GetInstanceById($id){
		return Model::_GetInstanceById("User",$id);
	}

	function GetInstanceByLogin($login){
		return Model::FindFirst(array(
			"class_name" => "User",
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
?>
