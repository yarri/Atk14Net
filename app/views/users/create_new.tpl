<h2>{$page_title}</h2>

{render partial=shared/form_error small_form=1}

{form}
<fieldset>

	{render partial=shared/form_field fields=login,password,password_confirmation,name,email}

	<div class="buttons">
	<button type="submit">Sign Up</button>
	</div>

</fieldset>
{/form}
