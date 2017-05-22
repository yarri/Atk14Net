<?php
class TcArticle extends TcBase {

	function test(){
		$a = Article::CreateNewRecord([
			"title" => "Sample Article",
			"teaser" => "Sample Teaser",
			"body" => "Sample Body",
			"author" => "John Doe",
		]);

		$this->assertEquals("sample-article",$a->getSlug());
	}
}
