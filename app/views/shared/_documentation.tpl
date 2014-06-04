<div class="documentation">
	<h2>Inspect source code of this page!</h2>

	<ul>
		{foreach from=$doc_source_files item=s_file}
			<li>{src file=$s_file add_br=false}</li>
		{/foreach}
	</ul>

	<h3>Files every page is using</h3>
	<ul>
		<li>{src file="app/controllers/application.php" add_br=false}</li>
		<li>{src file="app/models/application_model.php" add_br=false}</li>
		<li>{src file="app/forms/application_form.php" add_br=false}</li>
		<li>{src file="app/layouts/default.tpl" add_br=false}</li>
	</ul>

	<hr>

	<ul>
		{if $namespace}
			<li>Current namespace: {$namespace}</li>
		{/if}
		<li>Current controller: <span class="badge">{$controller}</span></li>
		<li>Current action: <span class="badge">{$action}</span></li>
	</ul>
</div>
