<html>
<head>
	<title>{$page_title|h} | Administration</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="description" content="{$page_description}" />

  {stylesheet_link_tag file="blueprint/screen.css" media="screen, projection"}
  {stylesheet_link_tag file="blueprint/print.css" media="print"}
  <!--[if IE]>
  {stylesheet_link_tag file="blueprint/ie.css" media="screen, projection"}
  <![endif]-->

	{javascript_script_tag file="jquery/jquery.js"}
	{javascript_script_tag file="jquery/plugins/livequery/jquery.livequery.js"}
	{javascript_script_tag file="atk14.js"}

	{placeholder for="js"}
	{placeholder for="head"}
</head>
<body>
	<div class="container">
	<div>
		<ul>
			<li>{a controller=users action=overview}{t}Users{/t}{/a}</li>
			<li>{a controller=categories action=overview}{t}Product Categories{/t}{/a}</li>
			<li>{a controller=products action=overview}{t}Products{/t}{/a}</li>
		</ul>
	</div>
		{render partial=shared/flash_message}
		<div>
		{placeholder}
		</div>
	</div>
</body>
</html>
