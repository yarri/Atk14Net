<div class="documentation">
	<h2>{!"binoculars"|icon} Inspect source code of this page!</h2>

	<ul class="list--icons">
		{foreach from=$doc_source_files item=s_file}
			<li>
				<span class="list--icons__icon"><span class="fileicon fileicon-{$s_file|filetype} fileicon-color"></span></span>
				<span class="list--icons__value">{src file=$s_file add_br=false}</span>
			</li>
		{/foreach}
	</ul>

	<h3>Files every page is using</h3>
	<ul class="list--icons">
		<li>
			<span class="list--icons__icon"><span class="fileicon fileicon-php fileicon-color"></span></span>
			<span class="list--icons__value">{src file="app/controllers/application.php" add_br=false}</span>
		</li>
		<li>
			<span class="list--icons__icon"><span class="fileicon fileicon-php fileicon-color"></span></span>
			<span class="list--icons__value">{src file="app/models/application_model.php" add_br=false}</span>
		</li>
		<li>
			<span class="list--icons__icon"><span class="fileicon fileicon-php fileicon-color"></span></span>
			<span class="list--icons__value">{src file="app/forms/application_form.php" add_br=false}</span>
		</li>
		<li>
			<span class="list--icons__icon"><span class="fileicon fileicon-tpl fileicon-color"></span></span>
			<span class="list--icons__value">{src file="app/layouts/default.tpl" add_br=false}</span>
		</li>
	</ul>
	<h3>Files every page is using</h3>
	<ul class="list--icons">
		<li>
			<span class="list--icons__icon"><span class="fileicon fileicon-php fileicon-color"></span></span>
			<span class="list--icons__value">{src file="app/controllers/application.php" add_br=false}</span>
		</li>
		<li>
			<span class="list--icons__icon"><span class="fileicon fileicon-php fileicon-color"></span></span>
			<span class="list--icons__value">{src file="app/models/application_model.php" add_br=false}</span>
		</li>
		<li>
			<span class="list--icons__icon"><span class="fileicon fileicon-php fileicon-color"></span></span>
			<span class="list--icons__value">{src file="app/forms/application_form.php" add_br=false}</span>
		</li>
		<li>
			<span class="list--icons__icon"><span class="fileicon fileicon-tpl fileicon-color"></span></span>
			<span class="list--icons__value">{src file="app/layouts/default.tpl" add_br=false}</span>
		</li>
	</ul>

	<hr>

	<ul class="list-unstyled mb-0">
		{if $namespace}
			<li>Current namespace: {$namespace}</li>
		{/if}
		<li>Current controller: <span class="badge badge-info">{$controller}</span></li>
		<li>Current action: <span class="badge badge-success">{$action}</span></li>
	</ul>
</div>
