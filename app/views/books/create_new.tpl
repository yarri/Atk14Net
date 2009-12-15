<h2>Create a new Book entry</h2>

{render partial=shared/form_error}

{form}
	<fieldset>
		{render partial=shared/form_field fields=title,code,shelfmark}
		<div class="button">
			<button type="submit">Save</button>
		</div>
	</fieldset>
{/form}
