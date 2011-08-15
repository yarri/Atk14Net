<tr>
	<td>{a action=detail id=$book}{$book->getTitle()|h}{/a}</td>
	<td>{$book->getAuthor()|h}</td>
	<td>{$book->getCode()|h}</td>
	<td>{$book->getShelfmark()|h}</td>
	<td>
		{a action=edit id=$book}Edit{/a} |
		{a_destroy id=$book}Destroy{/a_destroy}
	</td>
</tr>
