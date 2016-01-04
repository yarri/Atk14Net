<h1>Legal agreements</h1>

{render partial="shared/form_error"}

<p class="lead">Some legal agreements...</p>

<p>In order to Sign Up you have to accept the Legal Agreements</p>

{form}

	{render partial="shared/form_field" fields="confirm"}
	
	<div class="buttons">
		<button type="submit" class="btn btn-default">Continue</button>
	</div>
{/form}
