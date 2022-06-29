<div id="snippet" class="snippet">
	{render partial=detail}
</div>




{if !$request->xhr() && !$rendering_component}
	{a action=detail id=$snippet.next.id _class="btn btn-outline-primary"}show next snippet{/a}
{/if}
