<html>
<head>
	<title>{$page_title|h} | Store of the year</title>
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
		{render partial=shared/flash_message}
		{render partial=shared/user_info}
		{render partial=shared/cart_info}
		<div>
		{placeholder}
		</div>
	</div>
</body>
</html>
