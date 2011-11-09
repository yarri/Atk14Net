{render partial=shared/form_error}

<p>
The form on this pages has a protection against CSFR.
</p>
<p>
You can check out, that the form contains hidden field named <em>_token</em>. Try to modify it's value or just let it expire (about 10 mins).
</p>

{form}
	<fieldset>
		{render partial=shared/form_field field=name}
		<div class="buttons">
			<button type="submit">Send</button>
		</div>
	</fieldset>
{/form}
