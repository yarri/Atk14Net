<h2>Sortable Books</h2>

{form}
	<fieldset>
		{render partial=shared/form_field fields=search,code}
		<div class="button">
			<button type="submit">Search</button>
		</div>
	</fieldset>
{/form}

{if $total_amount}

	<table>
		<thead>
			<tr>
				{sortable key=title}<th>Title</th>{/sortable}
				{sortable key=code}<th>Code</th>{/sortable}
				<th>Shelfmark</th>
			</tr>
		</thead>
		<tbody>
			{render partial=overview_item from=$books item=book}
		</tbody>
	</table>

	{paginator}

{else}

	<p>Nothing was found.</p>

{/if}
