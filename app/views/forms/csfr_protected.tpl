{render partial=shared/form_error}

{form}
	<fieldset>
		{render partial=shared/form_field field=name}
		<div class="buttons">
			<button type="submit">Send</button>
		</div>
	</fieldset>
{/form}
