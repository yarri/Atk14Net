<h2>{$page_title}</h2>

<p>
Building links is easy like hell. Check out this pages` template source code.
</p>

<h4>Links to frontpage</h4>

<ul>
	<li>{a controller=main action=index}Homepage 1{/a}</li>
	<li>{a controller=main}Homepage 2{/a}</li>
	<li>{a controller=main _title="This is third link to the frontpage" _class=warning _with_hostname=1}Homepage 3 (with title, class and hostname){/a}</li>
	<li>{a controller=main _with_hostname="www.example.com"}Homepage 4 (with a different hostname){/a}</li>
	<li><a href="{link_to controller=main}">Yet another one</a></li>
	<li><a href="{$link_built_in_controller}">And finally one link built in controller</a></li>
</ul>

<h4>POST link</h3>

<ul>
	<li>{a action=some_post_action _method=post}Post link{/a}</li>
	<li>{a action=some_post_action _method=post _confirm="Are you sure to do this?"}Post link with a confirmation{/a}</li>
</ul>	
