{*
 * Displays flash message if there is any.
 *
 * Beware! There is no html escaping,
 * thus one can places a link to somewhere withing the flash message or something.
 *}
{if $flash->notice()}
	<div class="alert alert-info">{$flash->notice() nofilter}</div>
{/if}
{if $flash->error()}
	<div class="alert alert-danger">{$flash->error() nofilter}</div>
{/if}
{if $flash->success()}
	<div class="alert alert-success">{$flash->success() nofilter}</div>
{/if}
