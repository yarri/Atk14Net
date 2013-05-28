{render partial=$snippet.template}

{if $request->xhr() || $rendering_component}
<hr />
{a_remote id=$snippet.next.id _title="show another code snippet"}show next snippet{/a_remote} | {a action=detail id=$snippet.id _title="permanent link to the {$snippet.title}"}permalink{/a}
<br />
<br />
{/if}
