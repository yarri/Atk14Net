<h1>{$page_title}</h1>

<p>Here is a list of snippets - short examples of code which help you to understand some aspects of the ATK4 Framework.</p>

<ul>
	{foreach $snippets as $snippet}
		<li>
			{a action=detail id=$snippet.id}{$snippet.title}{/a}
		</li>
	{/foreach}
</ul>
