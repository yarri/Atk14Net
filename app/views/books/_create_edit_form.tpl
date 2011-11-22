{render partial=shared/form_error}

{form}
	<fieldset>
		{render partial=shared/form_field fields=title,author,code,shelfmark}
		<div class="buttons">
			<button type="submit">Save</button>
		</div>
	</fieldset>
{/form}
