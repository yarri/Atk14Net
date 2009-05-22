<h2>{t}Edit product category{/t}</h2>

{render partial=shared/form_error}

{form}

<fieldset>
	{render partial=shared/form_field fields=title_cs,title_en,info_cs,info_en}

	<div class="button">
		<input type="submit" value="{t}Update{/t}" />
	</div>
</fieldset>

{/form}
