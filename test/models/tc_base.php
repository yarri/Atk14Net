<?php
class TcBase extends TcAtk14Model{

	function setUp(){
		$this->dbmole->begin();
	}

	function tearDown(){
		$this->dbmole->rollback();
	}
}
