{*
 * Vytiskne poznamku o chybe ve formulari.
 *}
{if $form->has_errors()}
	<div class="mainerr">
	{if $form->non_field_errors()}
		{if sizeof($form->non_field_errors())>1}
			{* pokud mame vice chyb, vygenerujeme seznam <ul><li> *}
			<p>
				<em>{t}Following errors have occured during the form validation:{/t}</em>
			</p>
			<ul>
				{render partial=shared/form_error_item from=$form->non_field_errors() item=error}
			</ul>
		{else}
			{* s jedinou chybou je to veselejsi... *}
			{assign var=errors value=$form->non_field_errors()}
			<em>{$errors.0|h}</em>
		{/if}
	{else}
		<p>
			<em>{t}Some entries has been filled up incorrectly! Check out the form and correct mistakes.{/t}</em>
		</p>
	{/if}	
	</div>
{/if}
