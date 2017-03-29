<h1>ATK14 is a fine testable framework</h1>

<ul>

<li>
<h4>Table</h4>
{code}
-- file: db/migrations/0006_users.sql
CREATE SEQUENCE seq_users;
CREATE TABLE users(
  id INT PRIMARY KEY DEFAULT NEXTVAL('seq_users'),
  login VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL
);
{/code}
</li>

<li>
<h4>Model</h4>
{code}{literal}
<?php
// file: app/models/user.php
class User extends ApplicationModel{
	/**
	 * $hash = User::HashPassword("secret","123"); // f2b14f68eb995facb3a1c35287b778d5bd785511B
	 */
	static function HashPassword($password,$salt = ""){
		return sha1("$password$salt");
	}

	/**
	 * $user = User::Login("rambo","secret"); // returns user when login and password are correct
	 */
	static function Login($login,$password){
		$user = User::FindByLogin($login);
		if($user && $user->getPassword()==User::HashPassword($password,$user->getId())){
			return $user;
		}
	}

	/**
	 * $user = User::CreateNewRecord(array(
	 *	"login" => "rambo",
	 *	"password" => "secret"
	 * )); // returns user with hashed password
	 */
	static function CreateNewRecord($values,$options = array()){
		if(!isset($values["id"])){ $values["id"] = User::GetNextId(); }
		$values["password"] = User::HashPassword($values["password"],$values["id"]);
		return parent::CreateNewRecord($values,$options);
	}
}
{/literal}{/code}
</li>

<li>
<h4>Tests</h4>
{code}{literal}
<?php
// file: test/models/tc_user.php
class TcUser extends TcBase{
	function testHashingPassword(){
		$rambo = User::CreateNewRecord(array("login" => "rambo", "password" => "secret"));
		$rocky = User::CreateNewRecord(array("login" => "rocky", "password" => "secret"));
		$this->assertTrue($rambo->getPassword()!="secret");
		$this->assertEquals(User::HashPassword("secret",$rambo->getId()),$rambo->getPassword());

		$this->assertTrue($rocky->getPassword()!=$rambo->getPassword()); // different salts, different hashes

		$this->assertNull(User::Login("rambo","bad try"));

		$user = User::Login("rambo","secret");
		$this->assertEquals($rambo->getId(),$user->getId());

		$user = User::Login("rocky","secret");
		$this->assertEquals($rocky->getId(),$user->getId());
	}
}
{/literal}{/code}
</li>

<li>
<h4>Run test case for the given model</h4>
{code}{literal}
$ cd test/models/
$ ../../scripts/run_unit_tests tc_user.php
--- tc_user.php


Time: 0.133278

OK (1 test)
{/literal}{/code}
</li>

<li>
<h4>Run all test cases in the project</h4>

{code}{literal}
$ cd /path/to/your/project/
$ ./scripts/run_all_tests
{/literal}{/code}
</li>

</ul>


