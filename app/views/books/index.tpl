<h2>{$page_title|h}</h2>

{form}
	<fieldset>
		{render partial=shared/form_field fields=search,code}
		<div class="button">
			<button type="submit">Search</button>
		</div>
	</fieldset>
{/form}
<p>
	{a action=create_new}Create new entry{/a}
</p>


{if !$finder->isEmpty()}

	<table>
		<thead>
			<tr>
				{sortable key=title}<th>Title</th>{/sortable}
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

{else}

	<p>Nothing was found.</p>

{/if}
