<!DOCTYPE html>
<html lang="{$lang}">

<head>
	<meta charset="utf-8">
	<title>{$page_title|h} | ATK14</title>
	<meta name="description" content="{$page_description}" />
	<meta name="x-root" content="{$root|h}" />
	<meta name="x-lang" content="{$lang|h}" />
	<meta name="x-action" content="{h}{$controller}/{$action}{/h}" />

	{stylesheet_link_tag file="blueprint/screen.css" media="screen, projection"}
	{stylesheet_link_tag file="blueprint/print.css" media="print"}
	<!--[if IE]>
		{stylesheet_link_tag file="blueprint/ie.css" media="screen, projection"}
	<![endif]-->
	{stylesheet_link_tag file="styles.css" media="screen, projection"}

	<script type="text/javascript" src="http{if $request->ssl()}s{/if}://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script type="text/javascript" src="http{if $request->ssl()}s{/if}://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>
	{javascript_script_tag file="atk14.js"}
	{javascript_script_tag file="application.js"}

	{placeholder for="head"}

	{javascript_tag}
		{placeholder for="js"}
	{/javascript_tag}
</head>

<body>
	<div class="container">
			{if $controller==main && $action==index}
				<h1>ATK14 is a PHP framework for fearless gyus</h1>
			{else}
				<h1>{a controller=main action=index}ATK14{/a}</h1>
			{/if}

		{render partial=shared/flash_message}
		<div>
			{placeholder}
		</div>

		{render partial=shared/user_info}

		{render partial=shared/documentation}
	</div>
</body>

</html>
