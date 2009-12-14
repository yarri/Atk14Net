<h2>Books</h2>

{form}
	<fieldset>
		{render partial=shared/form_field field=search}
		<div class="button">
			<button type="submit">Search</button>
		</div>
	</fieldset>
{/form}

{if $total_amount}

	<table>
		<thead>
			<tr>
				<th>Title</th>
				<th>Code</th>
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
