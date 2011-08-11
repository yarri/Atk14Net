<html>
<head>
	<title>{$page_title|h} | Administration</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="description" content="{$page_description}" />
	<meta name="x-root" content="{$root|h}" />
	<meta name="x-lang" content="{$lang|h}" />
	<meta name="x-action" content="{h}{$controller}/{$action}{/h}" />

  {stylesheet_link_tag file="lib/blueprint-css/blueprint/screen.css" media="screen, projection"}
  {stylesheet_link_tag file="lib/blueprint-css/blueprint/print.css" media="print"}
  <!--[if IE]>
  {stylesheet_link_tag file="lib/blueprint-css/blueprint/ie.css" media="screen, projection"}
  <![endif]-->

	{javascript_script_tag file="jquery.php"}
	{javascript_script_tag file="atk14.js"}

	{placeholder for="head"}

	<script type="text/javascript">
	 <!--
		{placeholder for="js"}
		$(function() \{
			{placeholder for="domready"}
		\});
	 // -->
	</script>

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
