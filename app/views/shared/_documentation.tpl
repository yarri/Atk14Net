<div class="documentation">
		<h3>Inspect source code of this page!</h3>
		{placeholder for="doc"}

		{foreach from=$doc_source_files item=s_file}
			{src file=$s_file}
		{/foreach}
		<br />
		
		<h4>Files every page is using</h4>
		{src file="app/controllers/application.php"}
		{src file="app/models/application_model.php"}
		{src file="app/forms/application_form.php"}
		{src file="app/layouts/default.tpl"}

		<br />
		{if $namespace}
		Current namespace: {$namespace}<br />
		{/if}
		Current controller: {$controller}<br />
		Current action: {$action}<br />
</div>		
