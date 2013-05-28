<tr>
	<td>{$user->getId()}</td>
	<td>{$user->g("login")}</td>
	<td>{$user->g("name")}</td>
	<td>{$user->g("email")}</td>
	<td>{$user->g("created_at")|format_datetime}</td>
	<td>
		{a action=edit id=$user}{t}Edit{/t}{/a} |
		{a_remote action=delete id=$user _class=confirm _method=post}{t}Delete{/t}{/a_remote}
	</td>
</tr>
