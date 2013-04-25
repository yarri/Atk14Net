<h2>{$page_title}</h2>

<p>
On this page there is an example of in-browser form validation.<br />
jQuery Validation plugin is used. Validation rules are provided by a ATK14`s form through the <em>js_validator</em>.<br />
Check out the controller, form and template source code.
</p>

{render partial="shared/form_error"}

{form}

<fieldset>

	{render partial="shared/form_field" fields="login,password,password_confirmation,name,email"}

	<div class="buttons">
	<input type="submit" value="Sign up" />
	</div>

</fieldset>

{/form}

{content for=js_script_tags}
	{javascript_script_tag file="libs/jquery/plugins/jquery.validate.js"}
{/content}

{content for=js}
	{literal}
	$(document).ready(function() {

		// in the validator there is no regexp test, so we add it
		$.validator.addMethod(
        "regex",
        function(value, element, regexp) {
						// regexp comes here as '/^[a-z]{1,5}$/i'
						// it must be splitted to: pattern='^[a-z]{1,5}', modifiers='i'
						var matches = regexp.match(/\/(.*)\/([^\/]*)/);
						var pattern = matches[1];
						var modifiers = matches[2];
					
						var re = new RegExp(pattern,modifiers);
            return this.optional(element) || re.test(value);
        },
        "Please check your input."
		);{/literal}

		// validate signup form on keyup and submit
		var validator = $("form").validate({
			rules: {to_json var=$js_validator->get_rules()},
			messages: {to_json var=$js_validator->get_messages()},
			// the errorPlacement has to take the table layout into account
			errorPlacement: function(error, element) {
				if ( element.is(":radio") )
					error.appendTo( element.parent().next().next() );
				else if ( element.is(":checkbox") )
					error.appendTo ( element.next() );
				else
					error.appendTo( element.parent() );
			},
			// set this class to error-labels to indicate valid fields
			success: function(label) {
				label.html("Ok").addClass("checked");
			}
		});
	});
{/content}
