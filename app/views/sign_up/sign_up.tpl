{render partial=shared/form_error}

{form}

<fieldset>

	{render partial=shared/form_field fields=login,password,password_confirmation,name,email}

	<div class="button">
	<input type="submit" value="Sign up" />
	</div>

</fieldset>

{/form}
