<tr>
	<td>{a action=detail id=$book}{$book->getTitle()}{/a}</td>
	<td>{$book->getAuthor()}</td>
	<td>{$book->getCode()}</td>
	<td>{$book->getShelfmark()}</td>
	<td>
		{a action=edit id=$book}Edit{/a} |
		{a_destroy id=$book}Destroy{/a_destroy}
	</td>
</tr>
