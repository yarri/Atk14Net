<tr>
	<td>{a action=detail id=$book xx=111}{$book->getTitle()|h}{/a}</td>
	<td>{$book->getCode()|h}</td>
	<td>{$book->getShelfmark()|h}</td>
	<td>
		{a action=edit id=$book}Edit{/a} |
		{a_destroy id=$book}Destroy{/a_destroy} |
		{a action=detail id=$book format=xml}as XML{/a} |
		{a action=detail id=$book format=json}as JSON{/a} |
		{a action=detail id=$book format=yaml}as YAML{/a}
	</td>
</tr>
