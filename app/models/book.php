<?php
/**
* // Searching for books
* $book = Book::GetInstanceById(11);
* $books = Book::GetInstanceById(array(11,12,22));
* $books = Book::GetInstanceById(array("b1" => 11, "b2" => 12, "b3" => 22));
* $books = Book::FindAll(array(
*		"conditions" => array(
*			"UPPER(title) LIKE UPPER(:search)",
*			"code=:code"
*		),
*		"bind_ar" => array(
*			":search" => "%Millenium%",
*			":code" => "123"
*		),
*		"order_by" => "title",
* 	"limit" => 10,
*		"offset" => 0
*	));
*
* // Creating a new book
* $book = Book::CreateNewRecord(array(
*		"title" => "Some Title",
*		"code" => "123",
*	));
*
* // Getting attributes
* $book->getValue("title");
* $book->g("title");
* $book->getTitle();
*
* // Setting attributes
* $book->setValue("title","Some Title");
* $book->s("title","Some Title");
* $book->s(array(
*		"title" => "Some Title",
*		"code" => "123",
*	));
*/
class Book extends ApplicationModel{

	function getTitle(){ return $this->g("title"); }
	function getCode(){ return $this->g("code"); }
	function getShelfmark(){ return $this->g("shelfmark"); }

	function getSlug(){
		$title = new String($this->getTitle());
		return (string)$title->downcase()->gsub('/[^a-z0-9]/','-')->gsub('/-{2,}/','-')->gsub('/^-/','-')->gsub('/-$/','');
	}
}	
