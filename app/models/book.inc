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
* $books = Model::FindFirst(array(
*		""
*	))
*
*
*
*
*/
class Book extends Model{
	function Book(){
		parent::Model("books");
	}
	
	function CreateNewRecord($values){
		/*
		$values = array_merge(array(
			"..."
		),$values);	*/
		return Model::_CreateNewRecord("Book",$values);
	}

	function GetInstanceById($id){
		return Model::_GetInstanceById("Book",$id);
	}

	function getTitle(){ return $this->g("title"); }
	function getCode(){ return $this->g("code"); }
	function getShelfmark(){ return $this->g("shelfmark"); }
}	
