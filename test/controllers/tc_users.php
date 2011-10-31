<?php
class tc_users extends tc_base{
	function test_login(){
		$client = new Atk14Client();

		$user = User::CreateNewRecord(array(
			"login" => "testing_user",
			"password" => "password",
			"name" => "Testing User",
			"email" => "testing@user.com",
		));

		// bad password
		$c = $client->post("users/login",array(
			"login" => "john",
			"password" => "bad-password",		
		));
		$this->assertEquals(200,$c->response->getStatusCode());
		$this->assertFalse($c->form->is_valid());
		$this->assertNull($c->session->g("user_id"));
		$this->assertContains("Invalid username or password",$client->getContent());

		$client->session->clear();

		// coorect password
		$c = $client->post("users/login",array(
			"login" => "testing_user",
			"password" => "password",
		));
		$this->assertTrue($c->response->redirected());
		$this->assertTrue($c->form->is_valid());
		$this->assertTrue(is_int($c->session->g("user_id")));
		$this->assertEquals("You have been succesfully logged in",$c->flash->notice());

		$client->session->clear();

		// good password but cookies are disabled
		$client->disableCookies();
		$c = $client->post("users/login",array(
			"login" => "testing_user",
			"password" => "password",
		));
		$this->assertEquals(200,$c->response->getStatusCode());
		$this->assertFalse($c->form->is_valid());
		$this->assertNull($c->session->g("user_id"));
		$this->assertContains("Please, enable cookies in your browser in order to login",$client->getContent());

		$user->destroy();
	}
}
