{assign js_validator $form->js_validator()}

<h1>{$page_title}</h1>

<p class="lead">On this page there is an example of in-browser form validation. jQuery Validation plugin is used. Validation rules are provided by a ATK14`s form through the <code>js_validator</code>. Check out the controller, form and template source code.</p>

{render partial="shared/form_error"}

{form _novalidate=novalidate _data-validation-messages="{$js_validator->get_messages()|to_json}" _data-validation-rules="{$js_validator->get_rules()|to_json}"}

<fieldset>

	{render partial="shared/form_field" fields="login,password,password_confirmation,name,email"}

	<div class="buttons">
		<input type="submit" value="Sign up" class="btn btn-default">
	</div>

</fieldset>

{/form}
