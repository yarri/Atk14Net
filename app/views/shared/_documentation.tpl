<div class="documentation">
		<h3>Browsing relevant file sources</h3>
		{placeholder for=doc}

		{foreach from=$doc_source_files item=s_file}
			{src file=$s_file}
		{/foreach}
		<br />
		
		Every controller is a descendant of the {src file=controllers/application.inc title="ApplicationController" add_br=false}<br />
		Every form is a descendant of the {src file=forms/application_form.inc title="ApplicationForm" add_br=false}<br />
		Default layout is {src file=layouts/_default.tpl add_br=false}<br />

		<br />
		Current controller: {$controller}<br />
		Current action: {$action}<br />
		Current namespace: {$namespace}<br />
		Current language: {$lang}<br />
</div>		
