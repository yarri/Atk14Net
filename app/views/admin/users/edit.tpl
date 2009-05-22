<h2>{t}User Editing{/t}</h2>

{render partial=shared/form_error}

{form}

<fieldset>
	{render partial=shared/form_field fields=login,name,email,is_admin}

	<div class="button">
		<input type="submit" value="{t}Update{/t}" />
	</div>
</fieldset>

{/form}
