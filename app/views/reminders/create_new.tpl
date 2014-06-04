<h1>Reminder</h1>

{form}
	<fieldset>

	{render partial="shared/form_field" fields="email_to,book"}

	<div class="form-group">
		<button type="submit" class="btn btn-default">Send notification</button>
		<p class="help-block">Don't be afraid. The e-mail wont be sent, it's source will be displayed instead.</p>
	</div>	

	</fieldset>
{/form}
