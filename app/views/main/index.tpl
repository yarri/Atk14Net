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

<ul>
	<li>
		<h4>CRUD operations</h4>
		<p>
			A typical examples of CRUD (create, read, update and delete) controllers
		</p>
		<ul>
			<li>{a controller=books}Books{/a}</li>
			<li>{a controller=articles}Articles{/a}</li>
		</ul>
	</li>

	<li>
		<h4>{a controller=links}Links{/a}</h4>
		<p>
			How one can create a link to somewhere...
		</p>
	</li>

	<li>
		<h4>{a controller=remote_links}Remote links{/a}</h4>
		<p>
			A few examples of XHR links
		</p>
	</li>

	<li>
		<h4>{a controller=reminders action=create_new}Sending emails{/a}</h4>
		<p>How easy it is to send an email somewhere...</p>
	</li>

	<li>
		<h4>Sign up procedure examples</h4>
		<p>There are three interesting variants available.</p>
		<ul>
			<li>{a controller=sign_up action=sign_up}Classic{/a}</li>
			<li>{a controller=sign_up_multistep action=sign_up}Multisptep{/a}</li>
			<li>{a controller=sign_up_js_validation action=sign_up}With Javascript validation{/a}</li>
		</ul>
	</li>

	<li>
		<h4>Forms</h4>
		<ul>
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
	</li>

</ul>