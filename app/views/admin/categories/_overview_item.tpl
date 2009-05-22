<li>
	{$category->g("title_cs")|h}
		{a action=edit id=$category}{t}edit{/t}{/a} |
		{a_remote action=destroy id=$category _method=post _class=confirm}{t}delete{/t}{/a_remote}
</li>
