<div id="mascot">
	<svg class="atk14mascot" style="width: 330px; height:330px"><use xlink:href="#atk14-mascot"></use></svg>
	<blockquote><span title="this is what the official ATK14 mascot is saying today">{$mod}<sup>*</sup></span></blockquote>

	<p>
		<sup>*</sup> <span title="this is true">The official ATK14 mascot rulez!</span>
	</p>
</div>


<h2>Code Snippet</h2>
<div>
	{render_component controller=snippets action=detail id=atk14_is_a_classy_mvc_framework}
</div>

<h2>Demos</h2>
<p class="lead">At any page you can inspect sources of all involved files.</p>

<div class="card-deck card-deck--3" style="flex-wrap: wrap;">

	<div class="card">
		<div class="card-header">CRUD operations</div>
		<div class="card-body">
			<p>A typical examples of CRUD (create, read, update and delete) controllers</p></div>
		<div class="card-footer">
			<ul class="list-unstyled">
				<li>{a controller=books}Books{/a}</li>
				<li>{a controller=articles}Articles{/a}</li>
			</ul>
		</div>
	</div>

	<div class="card">
		<div class="card-header">{a controller=links}Links{/a}</div>
		<div class="card-body">
			<p>How one can create a link to somewhere&hellip;</p></div>
		<div class="card-footer">
			{a controller=links}Links{/a}
		</div>
	</div>

	<div class="card">
		<div class="card-header">{a controller=remote_links}Remote links{/a}</div>
		<div class="card-body">
			<p>A few examples of XHR links</p>
		</div>
		<div class="card-footer">
			{a controller=remote_links}Remote links{/a}
		</div>
	</div>

	<div class="card">
		<div class="card-header">{a controller=reminders action=create_new}Sending emails{/a}</div>
		<div class="card-body">
			<p>How easy it is to send an email somewhere...</p>
		</div>
		<div class="card-footer">
			{a controller=reminders action=create_new}Sending emails{/a}
		</div>
	</div>

	<div class="card">
		<div class="card-header">Sign up procedure examples</div>
		<div class="card-body">
			<p>There are three interesting variants available.</p>
		</div>
		<div class="card-footer">
			<ul class="list-unstyled">
				<li>{a controller=sign_up action=sign_up}Classic{/a}</li>
				<li>{a controller=sign_up_multistep action=sign_up}Multisptep{/a}</li>
				<li>{a controller=sign_up_js_validation action=sign_up}With Javascript validation{/a}</li>
			</ul>
		</div>
	</div>

	<div class="card">
		<div class="card-header">Forms</div>
		<div class="card-body">Forms</div>
		<div class="card-footer">
			<ul class="list-unstyled">
				<li>{a controller=money_transfers action=create_new}CSRF protected form{/a}</li>
				<li>Field examples
					{render partial="fields/list"}
				</li>
				<li>Asynchronous File Uploads
					<ul>
						<li>{a controller=chunked_file_uploads action=create_new}Chunked field upload{/a}</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>

</div>


