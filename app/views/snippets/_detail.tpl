{if $request->xhr() || $rendering_component}
<strong>code snippet</strong> ({a_remote id=$snippet.next.id _title="show another code snippet"}show next{/a_remote} | {a action=detail id=$snippet.id _title="permanent link to the {$snippet.title}"}permalink{/a})
{/if}
{render partial=$snippet.template}
