{*
 * Displays form`s error heading.
 *
 *	 {render partial="shared/form_error"}
 *	 {render partial="shared/form_error" form=$update_form}
 *}

{if $form->has_errors()}
		{if $form->non_field_errors()}
			{if sizeof($form->non_field_errors())>1}
				{* if there are more erorrs *}
				<div class="alert alert-danger">
					<p>
						<em>{t}The following difficulties have occurred during the form processing:{/t}</em>
					</p>
					<ul>
						{render partial="shared/form_error_item" from=$form->non_field_errors() item=error}
					</ul>
				</div>
			{else}
				{* if there is only one error *}
				{assign var=errors value=$form->non_field_errors()}
				<p class="alert alert-danger">
					<em>{!$errors.0}</em>
				</p>
			{/if}
		{else}
			<p class="alert alert-danger">
				<em>{t}Some of the items were filled incorrectly. Please, check the form and correct the errors.{/t}</em>
			</p>
		{/if}
{/if}
