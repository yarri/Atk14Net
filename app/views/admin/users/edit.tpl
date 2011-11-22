<h2>{t}User Editing{/t}</h2>

{render partial=shared/form_error}

{form}

<fieldset>
	{render partial=shared/form_field fields=login,name,email,is_admin}

	<div class="buttons">
		<input type="submit" value="Update" />
	</div>
</fieldset>

{/form}
