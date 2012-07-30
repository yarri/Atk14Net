{if $request->xhr() || $rendering_component}
{a_remote id=$snippet.next.id}show next snippet{/a_remote} | {a action=detail id=$snippet.id}permalink{/a}
{/if}
{render partial=$snippet.template}
