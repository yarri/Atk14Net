<h3>ATK14 is a way classy MVC framework</h3>

<ul>
<li>
<h4>Table</h4>
{code}
-- file: db/migrations/0005_books.sql
CREATE SEQUENCE seq_books;
CREATE TABLE books(
  id INT PRIMARY KEY DEFAULT NEXTVAL('seq_books'),
  title VARCHAR(255),
  author VARCHAR(255),
  publication_date DATE,
  cover_url VARCHAR(255)
);
{/code}
</li>

<li>
<h4>Model</h4>
<pre><code>{h}{literal}<?php
// file: app/models/book.php
class Book extends ApplicationModel{
  // if there is no need of any special, class could be empty 
}
{/literal}{/h}</code></pre>
</li>

<li>
<h4>Controller</h4>
{code}{literal}<?php
// file: app/controllers/books_controller.php
class BooksController extends ApplicationController{
  function detail(){
    $this->tpl_data["book"] = Book::FindById($this->params->getInt("id"));
  }
}{/literal}{/code}
</li>

<li>
<h4>View</h4>
{code}{literal}
{* file: app/views/books/detail.tpl *}
<h1>{$book->getTitle()|h}</h2>
<ul>
  <li>Author: {$book->getAuthor()|h}</li>
  <li>Publication date: {$book->getPublicationDate()|format_date}<li>
  <li>Cover: {$book->getCoverUrl()|display_image}</li>
</ul>
{/literal}{/code}
</li>

<li>
<h4>Layout</h3>

{code}{literal}
{* file: app/layouts/default.tpl *}
<html>
<head>
  <title>Books</title>
</head>	
<body>
  {placeholder}
</body>
</html>
{/literal}{/code}
</li>

<li>
<h4>URL scheme</h4>

{code}http://project.localhost/en/books/detail/?id=123{/code}
</li>
</ul>
