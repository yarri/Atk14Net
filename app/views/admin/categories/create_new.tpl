<h2>{t}Create new product category{/t}</h2>

{render partial=shared/form_error}

{form}

<fieldset>
	{render partial=shared/form_field fields=title_cs,title_en,info_cs,info_en}

	<div class="buttons">
		<input type="submit" value="Create" />
	</div>
</fieldset>

{/form}
