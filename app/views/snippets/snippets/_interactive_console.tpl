<h1>Interactive console</h1>

<p>ATK14 contains an interactive console. You may find it very useful.</p>

{code}
$ ./scripts/console 
**************************************************************************
**                                                                      **
**               Welcome to ATK14 interactive console                   **
**                                                                      **
**************************************************************************
Interactive mode enabled

php > $book = Book::FindById(1);
php > print_r($book->toArray());
Array
(
    [id] => 1
    [title] => Encyclopaedia Britannica
    [code] => AE5.E363
    [shelfmark] => B2.1411
    [author] => John Doe
    [year_of_publication] => 
)
php > $book->s("year_of_publication",2001);
php > exit
{/code}


