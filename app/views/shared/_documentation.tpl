<div class="documentation">
		<h3>How this page`s source code looks like?</h3>
		{placeholder for="doc"}

		{foreach from=$doc_source_files item=s_file}
			{src file=$s_file}
		{/foreach}
		<br />
		
		Every controller is a descendant of the {src file="app/controllers/application.php" title="ApplicationController" add_br=false}<br />
		Every model is a descendant of the {src file="app/models/application_model.php" title="ApplicationModel" add_br=false}<br />
		Every form is a descendant of the {src file="app/forms/application_form.php" title="ApplicationForm" add_br=false}<br />
		Default layout is {src file="app/layouts/default.tpl" add_br=false}<br />

		<br />
		Current controller: {$controller}<br />
		Current action: {$action}<br />
		Current namespace: {$namespace}<br />
		Current language: {$lang}<br />
</div>		
