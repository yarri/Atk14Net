<h2>{t}Create new product{/t}</h2>

{render partial=shared/form_error}

{form}

<fieldset>
	{render partial=shared/form_field fields=catalog_id,title_cs,title_en,short_info_cs,short_info_en,long_info_cs,long_info_en}

	<div class="button">
		<input type="submit" value="{t}Create{/t}" />
	</div>
</fieldset>

{/form}
