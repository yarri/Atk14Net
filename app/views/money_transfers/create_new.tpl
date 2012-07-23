<h2>{$page_title}</h2>

<p>The form on this pages has a protection against CSFR.</p>

<p>You can check out, that the form contains hidden field named _token. Try to modify it's value or just let it expire (about 10 mins).</p>

{render partial="shared/form_error" small_form=1}

{form}
<fieldset>
	{render partial="shared/form_field" fields="amount,bank_account"}
	<div class="buttons">
		<button type="submit">Send my money away</button>
	</div>
</fieldset>
{/form}
