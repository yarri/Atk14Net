<h1>{$page_title}</h1>

<p class="lead">{$page_description}</p>

{!$long_description}

{form}
	{render partial="shared/form_error"}

	{render partial="shared/form_field" fields=$form->get_field_keys()}

	<div class="form-group">
		<button type="submit" class="btn btn-default">Validate the Form</button>
	</div>
{/form}

{if $validated_data}
	<h2>The form`s cleaned data looks pretty good</h2>
	{dump var=$validated_data}
{/if}
