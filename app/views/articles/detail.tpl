<h1>{$page_title}</h1>

<p class="lead">
	{$article->getTeaser()}
</p>

<p><em>Posted by {$article->getAuthor()} on {$article->getPublishedAt()|format_date}</em></p>

{!$article->getBody()|markdown}
