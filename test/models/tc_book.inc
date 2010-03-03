<?
class tc_book extends tc_base{
	function test(){
		global $dbmole;

		$dbmole->begin();

		$book = Book::CreateNewRecord(array(
			"title" => "Test",
			"code" => "AB123",
			"shelfmark" => "SH1",
		));

		$this->assertEquals("Test",$book->g("title"));

		$book->s("title","Test 2");

		$this->assertEquals("Test 2",$book->g("title"));
	
		$dbmole->rollback();
	}
}
