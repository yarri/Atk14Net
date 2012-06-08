<blockquote><span>{$mod}<sup>*</sup></span></blockquote>
<img src="{$public}images/atk14.gif" alt="ATK14 Birdie" title="ATK14 Birdie" />

<p>
<sup>*</sup> The official ATK14 mascot rulez!
</p>

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
<pre><code>{h}{literal}<?php
// file: app/controllers/books_controller.php
class BooksController extends ApplicationController{
  function detail(){
    $this->tpl_data["book"] = Book::FindById($this->params["id"]);
  }
}{/literal}{/h}</code></pre>
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
  <title>Just a Great Application</title>
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

<h3>ATK14 is a fine testable framework</h3>

<ul>

<li>
<h4>Table</h4>
{code}
-- file: db/migrations/0006_users.sql
CREATE SEQUENCE seq_users;
CREATE TABLE users(
  id INT PRIMARY KEY DEFAULT NEXTVAL('seq_users'),
  login VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL
);
{/code}
</li>

<li>
<h4>Model</h4>
{code}{literal}
<?php
// file: app/models/user.php
class User extends ApplicationModel{
	/**
	 * $hash = User::HashPassword("secret","123"); // f2b14f68eb995facb3a1c35287b778d5bd785511B
	 */
	static function HashPassword($password,$salt = ""){
		return sha1("$password$salt");
	}

	/**
	 * $user = User::Login("rambo","secret"); // returns user when login and password are correct
	 */
	static function Login($login,$password){
		$user = User::FindByLogin($login);
		if($user && $user->getPassword()==User::HashPassword($password,$user->getId())){
			return $user;
		}
	}

	/**
	 * $user = User::CreateNewRecord(array(
	 *	"login" => "rambo",
	 *	"password" => "secret"
	 * )); // returns user with hashed password
	 */
	static function CreateNewRecord($values,$options = array()){
		if(!isset($values["id"])){ $values["id"] = User::GetNextId(); }
		$values["password"] = User::HashPassword($values["password"],$values["id"]);
		return ApplicationModel::CreateNewRecord($values,$options);
	}
}
{/literal}{/code}
</li>

<li>
<h4>Tests</h4>
{code}{literal}
<?php
// file: test/models/tc_user.php
class TcUser extends TcBase{
	function testHashingPassword(){
		$rambo = User::CreateNewRecord(array("login" => "rambo", "password" => "secret"));
		$rocky = User::CreateNewRecord(array("login" => "rocky", "password" => "secret"));
		$this->assertTrue($rambo->getPassword()!="secret");
		$this->assertEquals(User::HashPassword("secret",$rambo->getId()),$rambo->getPassword());

		$this->assertTrue($rocky->getPassword()!=$rambo->getPassword()); // different salts, different hashes

		$this->assertNull(User::Login("rambo","bad try"));

		$user = User::Login("rambo","secret");
		$this->assertEquals($rambo->getId(),$user->getId());

		$user = User::Login("rocky","secret");
		$this->assertEquals($rocky->getId(),$user->getId());
	}
}
{/literal}{/code}
</li>

<li>
<h4>Running tests</h4>
{code}{literal}
$ cd test/models/
$ ../../scripts/run_unit_tests tc_user.php
--- tc_user.php


Time: 0.133278

OK (1 test)
{/literal}{/code}
</li>
</ul>


<h3>Important links</h3>

<ul>
	<li><a href="http://book.atk14.net/">ATK14 Book</a></li>
	<li><a href="http://api.atk14.net/">API Reference</a></li>
	<li><a href="https://github.com/yarri/Atk14">ATK14 Home on Github</a></li>
	<li><a href="https://github.com/yarri/Atk14/tree/master/installation">ATK14 installation instructions</a></li>
</ul>


<h3>Here are some life examples</h3>

<p>
	At any page you can inspect sources of all involved files
</p>

<ul>
	<li>
		<h4>{a controller=books}Books, a typical CRUD controller{/a}</h4>
		<p>
			A typical example of displaying (with sorting) / creating / editing / destroying records in a record set
		</p>
	</li>

	<li>
		<h4>{a controller=links}Links{/a}</h4>
		<p>
			How one can create a link to somewhere...
		</p>
	</li>

	<li>
		<h4>{a controller=remote_links}Remote links{/a}</h4>
		<p>
			A few examples of XHR links
		</p>
	</li>

	<li>
		<h4>{a controller=reminders action=create_new}Sending emails{/a}</h4>
		<p>How easy it is to send an email somewhere...</p>
	</li>

	<li>
		<h4>Sign up procedure examples</h4>
		<p>There are three interesting variants available.</p>
		<ul>
			<li>{a controller=sign_up action=sign_up}Classic{/a}</li>
			<li>{a controller=sign_up_multistep action=sign_up}Multisptep{/a}</li>
			<li>{a controller=sign_up_js_validation action=sign_up}With Javascript validation{/a}</li>
		</ul>
	</li>

	<li>
		<h4>Forms</h4>
		<ul>
			<li>{a controller=money_transfers action=create_new}CSRF protected form{/a}</li>
			<li>{a controller=big_file_uploads action=create_new}Chunked file upload{/a}</li>
			<li>Field examples
				<ul>
					<li>{a controller=fields action=char_field}Character field{/a}</li>
					<li>{a controller=fields action=email_field}E-mail field{/a}</li>
					<li>{a controller=fields action=date_field}Date field{/a}</li>
					<li>{a controller=fields action=boolean_field}Boolean field{/a}</li>
					<li>{a controller=fields action=multiple_choice_field}Multiple choice field{/a}</li>
					<li>{a controller=fields action=regex_field}Regex field{/a}</li>
					<li>{a controller=fields action=file_field}File field{/a}</li>
					<li>{a controller=fields action=image_field}Image field{/a}</li>
				</ul>
			</li>
			<li>Custom Fields
				<ul>
					<li>{a controller=fields action=odd_number_field}Odd number field{/a}</li>
					<li>{a controller=fields action=url_field}URL field{/a}</li>
				</ul>
			</li>


		</ul>
	</li>

</ul>

<h3>We develop tools</h3>

<img src="{$public}images/easy_to_use.jpg" alt="Web developper" title="Using ATK14 is such a fun" />

<p>
	We are our tools believers. If you are brave enough you can believe in our tools too.
</p>
