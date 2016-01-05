<!DOCTYPE html>
<html lang="{$lang}">

	<head>
		<meta charset="utf-8">

		<title>{trim}
			{if $controller=="main" && $action=="index" && $namespace==""}
				ATK14 Framework
			{else}
				{$page_title} | {"ATK14_APPLICATION_NAME"|dump_constant}
			{/if}
		{/trim}</title>

		<meta name="description" content="{$page_description|h}">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">

		<link rel="alternate" title="ATK14`s Messages of the day" href="{link_to controller=rss action=motds}" type="application/rss+xml">

		{if $DEVELOPMENT}
			{render partial="shared/layout/dev_info"}

			{stylesheet_link_tag file="../dist/css/app.css" media="screen"}
		{else}
			{stylesheet_link_tag file="../dist/css/app.min.css" media="screen"}
		{/if}

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			{javascript_script_tag file="{$public}/dist/scripts/html5shiv.min.js"}
			{javascript_script_tag file="{$public}/dist/scripts/respond.min.js"}
		<![endif]-->

		<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/ui-lightness/jquery-ui.css" type="text/css" media="all">
	</head>

	<body class="body_{$controller}_{$action}" data-controller="{$controller}" data-action="{$action}">
		{render partial="shared/layout/header"}


		<div class="container">
			<div class="main" role="main">
				{if $breadcrumbs && sizeof($breadcrumbs)>=2} {* It makes no sense to display breadcrumbs with just 1 or no element *}
					{render partial="shared/breadcrumbs"}
				{/if}
				{render partial="shared/layout/flash_message"}
				{placeholder}
			</div>

			{render partial="shared/documentation"}
		</div>

		{if $DEVELOPMENT}
			{javascript_script_tag file="../dist/js/app.js"}
			<script src="//localhost:35729/livereload.js"></script>
		{else}
			{javascript_script_tag file="../dist/js/app.min.js"}
		{/if}

		{* Google analytics code *}
		{if $PRODUCTION}
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
		{/if}
	</body>
</html>
