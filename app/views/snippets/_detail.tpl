<div class="snippet__content-container">
<div class="snippet__content">
{render partial=$snippet.template}
</div>
</div>
{if $request->xhr() || $rendering_component}
{a_remote id=$snippet.next.id _title="show another code snippet" _class="btn btn-outline-primary btn-sm mr-2"}show next snippet{/a_remote} {a action=detail id=$snippet.id _title="permanent link to the {$snippet.title}"}permalink{/a}
{/if}
