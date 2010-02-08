{render partial=shared/form_error}

{form}

<fieldset>

	{render partial=shared/form_field fields=login,password,password_confirmation,name,email}

	<div class="button">
	<input type="submit" value="Sign up" />
	</div>

</fieldset>

{/form}

{content for=head}
	{javascript_script_tag file="jquery/plugins/jquery.validate.js"}
{/content}

{content for=js}
	$(document).ready(function() \{
		// validate signup form on keyup and submit
		var validator = $("form").validate(\{
			rules: {to_json var=$js_validator->get_rules()},
			messages: {to_json var=$js_validator->get_messages()},
			// the errorPlacement has to take the table layout into account
			errorPlacement: function(error, element) \{
				if ( element.is(":radio") )
					error.appendTo( element.parent().next().next() );
				else if ( element.is(":checkbox") )
					error.appendTo ( element.next() );
				else
					error.appendTo( element.parent() );
			\},
			// set this class to error-labels to indicate valid fields
			success: function(label) \{
				console.log(label);
				// set &nbsp; as text for IE
				label.html("&nbsp;").addClass("checked");
			\}
		\});
	\});
{/content}
