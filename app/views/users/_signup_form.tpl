{render partial="shared/form_error"}

{form_remote}

<fieldset>

	{render partial="shared/form_field" fields="login,password,password_confirmation,name,email"}

	<div class="buttons">
		<input type="submit" value="{t}Signup{/t}" />
	</div>

</fieldset>

{/form_remote}
