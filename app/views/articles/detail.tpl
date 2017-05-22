<h1>
	{$page_title}
	<div class="pull-right">
	{a action=edit id=$article _class="btn btn-default"}Edit article{/a}
	{a action=destroy id=$article _class="btn btn-default"}Delete article{/a}
	</div>
</h1>

<p class="lead">
	{$article->getTeaser()}
</p>

<p><em>Posted by {$article->getAuthor()} on {$article->getPublishedAt()|format_date}</em></p>

{!$article->getBody()|markdown}
