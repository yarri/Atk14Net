<h2>{$page_title}</h2>

{render partial=shared/form_error}
{form}
	<fieldset>
		{render partial="shared/form_field" fields=$form->get_field_keys()}
		<div class="buttons">
			<button type="submit">Validate the Form</button>
		</div>
	</fieldset>
{/form}

{if $validated_data}
	<h3>How the form output data looks like?</h3>
	{dump var=$validated_data}
{/if}
