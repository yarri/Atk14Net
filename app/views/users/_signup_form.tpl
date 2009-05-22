{render partial=shared/form_error}

{form_remote}

<fieldset>

<div class="button">
	{render partial=shared/form_field fields=login,password,password_confirmation,name,email}

	<input type="submit" value="{t}Signup{/t}" />
</div>
</fieldset>

{/form_remote}
