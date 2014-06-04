<h1>{$page_title}</h1>

<p class="lead">The form on this page has a protection against <abbr title="Cross-site request forgery">CSFR</abbr>. You can check out, that the form contains hidden field named <code>_token</code>. Try to modify it's value or just let it expire (about 10 mins).</p>

{render partial="shared/form_error" small_form=1}

{form}
	{render partial="shared/form_field" fields="amount,bank_account"}
	<div class="form-group">
		<button type="submit" class="btn btn-default">Send my money away</button>
	</div>
{/form}
