<h2>{$page_title}</h2>

<p>
	On this page you can upload a big file to the server. File will be split up to 1MB chunks using HTML5 File API and AJAX. The md5 sum will be displayed after a successful file upload.
</p>

<p>
	Some additional jquery plugins are required to do a chunked upload. Check out the template file create_new.tpl
</p>

{render partial=form}


{content for=js_script_tags}
		{javascript_script_tag file="libs/modernizr/modernizr-1.6.min.js"}
		{javascript_script_tag file="libs/plugins/jquery.fileupload.js"}
		{javascript_script_tag file="libs/plugins/jquery.sliceupload.js"}
{/content}

{* Enabling chunked upload on a given field *}
{content for=domready}{literal}
	$("#id_file").sliceUpload({
		chunkSize: 1024*1024,
		fileLoaded: function(responseText){
			if (responseText.length>0) {
				eval(responseText);
				return false;
			}
			return true;
		}
	});
{/literal}{/content}
