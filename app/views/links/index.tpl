<h2>{$page_tilte}</h2>

<h4>Links to frontpage</h4>

<ul>
	<li>{a controller=main action=index}Homepage 1{/a}</li>
	<li>{a controller=main}Homepage 2{/a}</li>
</ul>

<h4>POST link</h3>

<ul>
	<li>{a action=some_post_action _method=post}Post link{/a}</li>
	<li>{a action=some_post_action _method=post _confirm="Are you sure to do this?"}Post link with a confirmation{/a}</li>
</ul>	
