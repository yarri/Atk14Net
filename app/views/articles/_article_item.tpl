<h3>{a action="articles/detail" id=$article}{$article->getTitle()}{/a}</h3>
<p>
	<em>Posted by {$article->getAuthor()} on {$article->getPublishedAt()|format_date}</em><br>
	{$article->getTeaser()}
</p>
