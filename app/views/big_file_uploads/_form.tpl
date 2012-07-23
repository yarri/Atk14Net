{form}
	{if $uploaded}
		<div class="success">
		<h3>File uploaded!</h3>
		<ul>
			<li>filename: {$filename|h}</li>
			<li>size: {$filesize} bytes</li>
			<li>md5: {$checksum}</li>
		</ul>
		</div>
	{/if}


	<fieldset>
		{render partial="shared/form_field" field=file}
		<div class="buttons">
			<button type="submit">Send File</button>
		</div>
	</fieldset>
{/form}
