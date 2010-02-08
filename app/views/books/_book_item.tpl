<tr>
	<td>{a action=detail id=$book}{$book->getTitle()|h}{/a}</td>
	<td>{$book->getCode()|h}</td>
	<td>{$book->getShelfmark()|h}</td>
	<td>
		{a action=edit id=$book}Edit{/a} |
		{a_remote action=destroy id=$book _class=confirm _method=post}Destroy{/a_remote}
	</td>
</tr>
