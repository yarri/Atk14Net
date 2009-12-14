<h2>Books</h2>

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
