{if $flash->notice()}
	<div class="flash notice">{$flash->notice()|h}</div>
{/if}
{if $flash->error()}
	<div class="flash error">{$flash->error()|h}</div>
{/if}
