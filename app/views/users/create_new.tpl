{render partial=shared/form_error small_form=1}

{form}
<fieldset>

	{render partial=shared/form_field fields=login,password,password_confirmation,name,email}

	<div class="button">
	<input type="submit" value="{t}Login{/t}" />
	</div>

</fieldset>
{/form}
