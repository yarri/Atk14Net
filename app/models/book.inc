<?
/**
* $book = Book::GetInstanceById(11);
* $books = Book::GetInstanceById(array(11,12,22));
* $books = Book::GetInstanceById(array("b1" => 11, "b2" => 12, "b3" => 22));
*
* $book = Book::CreateNewRecord(array(
*		"title" => "Some Title",
*		"code" => "123",
*	));
*
* $book->getValue("title");
* $book->g("title");
* $book->title; // TODO
*
* $book->setValue("title","Some Title");
* $book->s("title","Some Title");
* $book->s(array(
*		"title" => "Some Title",
*		"code" => "123",
*	));
* $books = ApplicationModel::FindFirst(array(
*		""
*	))
*
*
*
*
*/
class Book extends ApplicationModel{
	function Book(){
		parent::ApplicationModel("books");
	}
	
	function getTitle(){ return $this->g("title"); }
	function getCode(){ return $this->g("code"); }
	function getShelfmark(){ return $this->g("shelfmark"); }
	function getSlug(){
		$title = new String($this->getTitle());
		return (string)$title->downcase()->gsub('/[^a-z0-9]/','-')->gsub('/-{2,}/','-')->gsub('/^-/','-')->gsub('/-$/','');
	}
}	
