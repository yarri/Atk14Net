<?php
class TcUser extends TcBase{
	function test_get_instance_by_login(){
		$this->assertNull(User::FindByLogin("unit_testing_user"));

		$new_user = User::CreateNewRecord(array(
			"login" => "unit_testing_user",
			"password" => "some_secret",
			"name" => "Unit Testing User",
			"email" => "unit@testing.com",
		));

		$this->assertTrue(is_object($user = User::FindByLogin("unit_testing_user")));
		$this->assertEquals($new_user->getId(),$user->getId());
	}
}
