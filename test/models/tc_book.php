<?php
class TcBook extends TcBase{
	function test(){
		$book = Book::CreateNewRecord(array(
			"title" => "Test",
			"code" => "AB123",
			"shelfmark" => "SH1",
		));

		$this->assertEquals("Test",$book->g("title"));

		$book->s("title","Test 2");

		$this->assertEquals("Test 2",$book->g("title"));
	}
}
