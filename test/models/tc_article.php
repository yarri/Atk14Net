<?php
class TcArticle extends TcBase {

	function test(){
		$a = Article::CreateNewRecord([
			"id" => 123,
			"title" => "Sample Article",
			"teaser" => "Sample Teaser",
			"body" => "Sample Body",
			"author" => "John Doe",
		]);

		$this->assertEquals("sample-article-123",$a->getSlug());

		$a2 = Article::GetInstanceBySlug("sample-article-123");
		$this->assertInstanceOf("Article",$a2);
		$this->assertEquals(123,$a2->getId());

		$this->assertNull(Article::GetInstanceBySlug("non-existing-slug"));
	}
}
