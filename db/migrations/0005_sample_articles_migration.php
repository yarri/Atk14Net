<?php
class SampleArticlesMigration extends ApplicationMigration {
	function up(){

		Article::CreateNewRecord([
			"title" => "Happy Millenium",
			"teaser" => "Many wishes to the new millennium",
			"body" => trim("
We wish you Happy Millenium!

May all ATK14 developers are doing their job in peace.

ATK14 Development Team"),
			"author" => "Charlie Root",
			"published_at" => "2000-01-01",
		]);

		Article::CreateNewRecord([
			"title" => "ATK14 Skelet is out!",
			"teaser" => "We are happy to announce the availability of the ATK14 Skelet",
			"body" => trim("
ATK14 Skelet is carefully selected & minimalistic set of functionality you may require at the start of your next web project.

You can find more information at following addresses

  * [AKT14 Skelet on Github](https://github.com/atk14/Atk14Skelet)
  * [Atk14 Site](http://www.atk14.net/)
  * [Atk14 Forum](http://forum.atk14.net/)
  * [Atk14 Book](http://book.atk14.net/)

Remember! Your projects shall run on [ATK14 Framework](http://www.atk14.net/), for now and ever after!"),
			"author" => "Charlie Root",
			"published_at" => "2013-04-12",
		]);
	}
}
