<h2>{$page_title|h}</h2>

<table>
	<tbody>
		<tr>
			<th>Id</th>
			<td>{$book->getId()}</td>
		</tr>
		<tr>
			<th>Title</th>
			<td>{$book->getTitle()}</td>
		</tr>
		<tr>
			<th>Author</th>
			<td>{$book->getAuthor()}</td>
		</tr>
		<tr>
			<th>Book Code</th>
			<td>{$book->getCode()}</td>
		</tr>
		<tr>
			<th>Shelf mark</th>
			<td>{$book->getShelfmark()}</td>
		</tr>
	</tbody>
</table>

<h4>Other formats</h4>
<p>
	{a action=detail id=$book format=xml}as XML{/a} |
	{a action=detail id=$book format=json}as JSON{/a} |
	{a action=detail id=$book format=yaml}as YAML{/a}
</p>
