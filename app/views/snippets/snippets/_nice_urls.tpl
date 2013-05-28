<h4>ATK14`s nice URLs</h4>

<ul>

<li>
	<h4>Generic URLs</h4>
	URL to article`s detail in default form.
	<ul>
		<li>http://www.example.com/en/articles/detail/?id=123</li>
		<li>http://www.example.com/cs/articles/detail/?id=123</li>
	</ul>
</li>

<li>	
	<h4>Adding Routes</h4>
	{code}
<?php
// file: config/routers/default_router.php
class DefaultRouter extends Atk14Router{

	var $namespace = "";
	
	function setUp(){
		
		$this->addRoute("/article-<id>/","en/articles/detail",array("id" => "/[0-9]+/"));
		$this->addRoute("/clanek-<id>/","cs/articles/detail",array("id" => "/[0-9]+/"));

		// other default routes
		// ...
		// ...
		// ...
	}
}
	{/code}	
</li>	

<li>
	<h4>Nice URLs</h4>
	An article`s detail URL now looks slightly nicer.
	<ul>
		<li>http://www.example.com/article-123/</li>
		<li>http://www.example.com/clanek-123/</li>
	</ul>
</li>

<li>
	<h4>Decompiling Nice URLs</h4>
	{code}{literal}
$ ./scripts/recognize_route http://www.example.com/article-123/
URI: /article-123/
page_title: 
page_description: 

namespace=
controller=articles
action=detail
lang=en
id=123

{a controller="articles" action="detail" id="123"}link{/a}
	{/literal}{/code}	
</li>
</ul>
