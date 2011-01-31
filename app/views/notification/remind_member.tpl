<h2>Reminder<h2>
{form}
	<p>Press 'Send' to send email</p>
	<button type="submit">Send</button>
{/form}

<p>You also need additional files for sending emails:</p>
<ul>
	<li>{a controller=sources action=display file=controllers/admin/application_mailer.inc}ApplicationMailer controller{/a}</li>
	<li>{a controller=sources action=display file=views/admin/mailer/send_reminder.tpl}Template of the email body{/a}</li>
</ul>
