{render partial="shared/form_error"}

{form_remote}

<fieldset>

{render partial="shared/form_field" fields="login,password"}

<div class="buttons">
<input type="submit" value="{t}Login{/t}" />
</div>

</fieldset>

{/form_remote}
