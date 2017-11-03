<h1>
	{$page_title}
	{a action=create_new _class="btn btn-primary pull-right"}Create new article{/a}
</h1>

{if $finder->isEmpty()}
	<p>At the moment there is no article &rarr; {a action="create_new"}Create the first article{/a}</p>
{else}
	{render partial="article_item" from=$finder->getRecords() item=article}
{/if}

{paginator}
