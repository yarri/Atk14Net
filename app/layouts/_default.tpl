<!DOCTYPE html>
<html lang="{$lang}">

	<head>
		<meta charset="utf-8">

		<title>{$page_title|h} | {"ATK14_APPLICATION_NAME"|dump_constant}</title>
		<meta name="description" content="{$page_description|h}" />
		{render partial=shared/layout/dev_info}

		<meta name="viewport" content="width=device-width,initial-scale=1">

		{stylesheet_link_tag file="lib/blueprint-css/blueprint/screen.css" media="screen, projection"}
		{stylesheet_link_tag file="lib/blueprint-css/blueprint/print.css" media="print"}
		<!--[if IE]>
			{stylesheet_link_tag file="lib/blueprint-css/blueprint/ie.css" media="screen, projection"}
		<![endif]-->
		{stylesheet_link_tag file="styles.css" media="screen, projection"}

		<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/ui-lightness/jquery-ui.css" type="text/css" media="all" />

		{placeholder for="head"}
	</head>

	<body id="body_{$controller}_{$action}">

		<div class="container">
			<header>
				{if $controller==main && $action==index}
					<h1>ATK14 is a PHP framework for fearless guys</h1>
				{else}
					<h1>{a controller=main action=index _title="for fearless guys only"}ATK14 Demonstration Site{/a}</h1>
				{/if}
			</header>

			<div class="main" role="main">
				{render partial=shared/layout/flash_message}
				{placeholder}
			</div>

			<footer>
				{render partial=shared/user_info}
				{render partial=shared/documentation}
			</footer>
		</div>

		{* <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script> *}
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js"></script>

		<script>window.jQuery || document.write('<script src="{$public}javascripts/libs/jquery/jquery-1.6.2.min.js"><\/script>')</script>
		{javascript_script_tag file="atk14.js"}
		{javascript_script_tag file="application.js"}
		{* TODO: this is only nasty temporary solution, we know better... *}
		{javascript_tag}
			{placeholder for="js"}
			$(function() \{
				{placeholder for="domready"}
			\});
		{/javascript_tag}

		<!-- Prompt IE 6 users to install Chrome Frame. Remove this if you want to support IE 6.
			chromium.org/developers/how-tos/chrome-frame-getting-started -->
		<!--[if lt IE 7 ]>
			<script defer src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
			<script defer>window.attachEvent('onload',function()\{CFInstall.check(\{mode:'overlay'\})\})</script>
		<![endif]-->

		{* Google analytics code *}
		{javascript_tag}
			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-27229703-1']);
			_gaq.push(['_trackPageview']);

			(function() \{
				var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
			\})();
		{/javascript_tag}
	</body>
</html>
