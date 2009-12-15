<h2>Edit Book entry</h2>

{render partial=shared/form_error}

{form}
	<fieldset>
		<div>
			<label>Id</label>
			{$book->getId()}
		</div>
		{render partial=shared/form_field fields=title,code,shelfmark}
		<div class="button">
			<button type="submit">Save</button>
		</div>
	</fieldset>
{/form}
