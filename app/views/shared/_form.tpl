{*
 * Generic form
 *}

{if !$button_text}{assign button_text "Save"}{/if}

{form _novalidate="novalidate"}

	{render partial="shared/form_error"}

	<fieldset>
		{render partial="shared/form_field" fields=$form->get_field_keys()}
		<div class="buttons">
			<button type="submit">{$button_text}</button>
		</div>
	</fieldset>

{/form}
