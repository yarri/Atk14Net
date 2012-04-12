<?php
class TcSources extends TcBase{
	function test_detail(){
		$c = $this->client->get("sources/detail",array(
			"file" => "app/controllers/application.php",
		));
		$this->assertEquals(200,$c->response->getStatusCode());

		foreach(array(
			"app/controllers/application.php ",
			"/app/controllers/application.php",
			"app/controllers//application.php",
			"app/../app/controllers/application.php",
			"app",
			"config/random.txt"
		) as $invalid_file){
			$c = $this->client->get("sources/detail",array(
				"file" => $invalid_file
			));
			$this->assertEquals(404,$c->response->getStatusCode());
		}
	}
}
