<h1>{$page_title}</h1>

<p class="lead">Here is a sign up procedure served in a very classic way. Just one form is involved.</p>

{render partial="shared/form_error"}

{form}

<fieldset>

	{render partial="shared/form_field" fields="login,password,password_confirmation,name,email"}

	<div class="buttons">
		<input type="submit" value="Sign up" class="btn btn-default">
	</div>

</fieldset>

{/form}
