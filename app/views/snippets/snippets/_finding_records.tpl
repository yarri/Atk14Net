<h1>ATK14 gives you more ways how to find records in a table</h1>

{code}
<?php
$book = Book::GetInstanceById(123);
$books = Book::GetInstanceById(array(123,124)); // $books[0], $books[1]
$books = Book::GetInstanceById(array("a" => 123, "b" => 124)); // $books["a"], $books["b"]

$book = Book::FindById(123);

$book = Book::FindByTitle("Roadside Picnic");

$books = Book::FindAllByAuthor("Jules Verne",array("order_by" => "title"));

// the next 3 ones retrieve the same record
$book = Book::FindFirst(array(
	"conditions" => array(
		"author" => "Jules Verne",
		"title" => "Twenty Thousand Leagues Under the Sea"
	)
));
$book = Book::FindFirst(array(
	"conditions" => array(
		"author=:author",
		"title=:title"
	),
	"bind_ar" => array(
		":author" => "Jules Verne",
		":title" => "Twenty Thousand Leagues Under the Sea"
	)
);
$book = Book::FindFirst("author","Jules Verne","title","Twenty Thousand Leagues Under the Sea");

// the next 2 calls are equal
$books = Book::FindAll(array(
	"conditions" => array(
		"author=:author",
		"title LIKE :sea"
	),
	"bind_ar" => array(
		":author" => "Jules Verne",
		":search" => "%Sea%"
	)
));
$books = Book::FindAll("author=:author AND title LIKE :search",array(
	":author" => "Jules Verne",
	":search" => "%Sea%"
));
{/code}


