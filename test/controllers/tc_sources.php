<?php
class tc_sources extends tc_base{
	function test_detail(){
		$client = new Atk14Client();
		$c = $client->get("sources/detail",array(
			"file" => "app/controllers/application.php",
		));
		$this->assertEquals(200,$c->response->getStatusCode());

		foreach(array(
			"app/controllers/application.php ",
			"/app/controllers/application.php",
			"app/controllers//application.php",
			"app/../app/controllers/application.php",
			"config/random.txt"
		) as $invalid_file){
			$c = $client->get("sources/detail",array(
				"file" => $invalid_file
			));
			$this->assertEquals(404,$c->response->getStatusCode());
		}
	}
}
