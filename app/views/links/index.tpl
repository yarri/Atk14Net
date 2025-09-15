<h1>{$page_title}</h1>

<p class="lead">Building links is easy like hell. Check out this pages` template source code.</p>

<h2>Links to frontpage</h2>
<ul>
	<li>{a controller=main action=index}Homepage 1{/a}</li>
	<li>{a action="main/index"}Homepage 2{/a}</li> {* condensed notation of controller and action combination *}
	<li>{a controller=main}Homepage 3{/a}</li> {* when no action is given and the controller differs from the current one, action "index" is considered *}
	<li>{a controller=main _title="This is third link to the frontpage" _class=warning _with_hostname=1}Homepage 4 (with title, class and hostname){/a}</li>
	<li>{a controller=main _with_hostname="www.example.com"}Homepage 5 (with a different hostname){/a}</li>
	<li><a href="{link_to controller=main id=123 format=xml}">Yet another one</a></li>
	<li><a href="{$link_built_in_controller}">And finally one link built in controller</a></li>
</ul>

<h2>POST links</h2>
<ul>
	<li>{a action=some_post_action p1=1 _method=post}Post link{/a}</li>
	<li>{a action=some_post_action p2=2 _method=delete}Delete link{/a}</li>
	<li>{a action=some_post_action p3=3 _method=get}Get link{/a}</li>
	<li>{a action=some_post_action p4=4 _method=get _confirm="Are you sure?"}Get link + confirm{/a}</li>
	<li>{a action=some_post_action p5=5 _method=post _confirm="Are you sure to do this?"}Post link with a confirmation{/a}</li>
	<li>{a action=some_post_action p6=6 _confirm="Are you sure to do this?"}Simple get + confirm{/a}</li>
</ul>
