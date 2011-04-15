<!DOCTYPE html>
<html lang="{$lang}">

<head>
	<meta charset="utf-8">
	<title>{$page_title|h} | ATK14 Demonstration Website</title>
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

	<!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if necessary -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.js"></script>
	<script>window.jQuery || document.write('<script src="/public/javascripts/libs/jquery/jquery-1.5.1.min.js">\x3C/script>')</script>
	{javascript_script_tag file="atk14.js"}
	{javascript_script_tag file="application.js"}

	{placeholder for="head"}

	{javascript_tag}
		{placeholder for="js"}
	{/javascript_tag}
</head>

<body>
	<div class="container">
		<h1>{a controller=main action=index}ATK14 Demonstration Website{/a}</h1>

		{render partial=shared/flash_message}
		{render partial=shared/user_info}
		{render partial=shared/cart_info}

		<div>
			{placeholder}
		</div>

		{render partial=shared/documentation}
	</div>
</body>

</html>
