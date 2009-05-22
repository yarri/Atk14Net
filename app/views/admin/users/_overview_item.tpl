<tr>
	<td>{$user->getId()}</td>
	<td>{$user->g("login")|h}</td>
	<td>{$user->g("name")|h}</td>
	<td>{$user->g("email")|h}</td>
	<td>{$user->g("created_at")|format_datetime}</td>
	<td>
		{a action=edit id=$user}{t}Edit{/t}{/a} |
		{a_remote action=edit id=$user _class=confirm _method=post}{t}Delete{/t}{/a_remote}
	</td>
</tr>
