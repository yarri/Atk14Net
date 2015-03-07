<h1>{$page_title}</h1>

<p class="lead">
	On this page you can upload a really big file (e.g. 1GB) to the server. 
	File will be split up to 1MB chunks using HTML5 File API and AJAX.
	The md5 sum of the file will be displayed after a successful upload.
</p>

<div class="progress">
	<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
		<span class="sr-only">60% Complete</span>
	</div>
</div>

{form}
	{render partial="shared/form_field" field="file"}
{/form}

<table class="table hide">
	<thead>
		<tr><th>Name</th><th>Size</th><th>Checksum</th></tr>
	</thead>
	<tbody>
	</tbody>
</table>
