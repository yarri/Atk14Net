{if $categories}

	<ul>
	{render partial=overview_item from=$categories item=category}
	</ul>

{else}

	<p>{t}No category was found{/t}</p>

{/if}

{a action=create_new parent_id=$parent}{t}Create new category{/t}{/a}
