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
* $books = inobj_TableRecord::FindFirst(array(
*		""
*	))
*
*
*
*
*/
class Book extends inobj_TableRecord{
	function Book(){
		parent::inobj_TableRecord("books");
	}
	
	function CreateNewRecord($values){
		/*
		$values = array_merge(array(
			"..."
		),$values);	*/
		return inobj_TableRecord::_CreateNewRecord("Book",$values);
	}

	function GetInstanceById($id){
		return inobj_TableRecord::_GetInstanceById("Book",$id);
	}

	function getTitle(){ return $this->g("title"); }
	function getCode(){ return $this->g("code"); }
	function getShelfmark(){ return $this->g("shelfmark"); }
}	
