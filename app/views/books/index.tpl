<h1 class="page-header">
	{$page_title}
	{a action=create_new _class="btn btn-primary"}Create new entry{/a}
</h1>

{form _class="form-inline"}
	{render partial="shared/form_field" field=search}
	<div class="form-group">
		<button type="submit" class="btn btn-default">Search</button>
	</div>
{/form}

<hr>


{if $finder}
	{if $finder->isEmpty()}
		<p class="alert alert-info">Your search did not match any books.</p>
	{else}
		<table class="table">
			<thead>
				<tr>
					{sortable key=title}<th>Title</th>{/sortable}
					{sortable key=author}<th>Author</th>{/sortable}
					{sortable key=code}<th>Code</th>{/sortable}
					<th>Shelfmark</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				{render partial=book_item from=$finder->getRecords() item=book}
			</tbody>
		</table>

		{paginator}
	{/if}
{/if}
