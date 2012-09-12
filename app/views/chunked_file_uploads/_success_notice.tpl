{if $uploaded}
	<div class="success">
	<h3>File uploaded!</h3>
	<ul>
		<li>filename: {$filename|h}</li>
		<li>size: {$filesize} bytes</li>
		<li>md5: {$checksum}</li>
	</ul>
	</div>
{else}
	<div class="error">
	<h3>Upload filed!</h3>
	<p>This should not happened!</p>
	</div>
{/if}

<p>
	{a action=create_new}Upload another file{/a}
</p>
