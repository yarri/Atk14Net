<html>
<head>
	<title>{$page_title|h} | ATK14 Powered Website</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
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

	{javascript_script_tag file="jquery.php"}
	{javascript_script_tag file="atk14.js"}

	{placeholder for="head"}

	{javascript_tag}
		{placeholder for="js"}
		$(function() \{
			{placeholder for="domready"}
		\});
	{/javascript_tag}

</head>
<body>
	<div class="container">  
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
