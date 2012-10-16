<?php
class TcBase extends TcAtk14Controller{

	function setUp(){
		$this->dbmole->begin();
	}

	function tearDown(){
		$this->dbmole->rollback();
	}
}
