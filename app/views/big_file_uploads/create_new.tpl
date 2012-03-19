<h2>{$page_title}</h2>

On this page you can upload a big file to the server. File will be split up to a 1MB chunks.

{render partial=form}


{* Some additional jquery plugins are required to do a chunked upload *}

{content for=js_script_tags}
		{javascript_script_tag file=libs/modernizr/modernizr-1.6.min.js}
		{javascript_script_tag file=libs/plugins/jquery.fileupload.js}
		{javascript_script_tag file=libs/plugins/jquery.sliceupload.js}
{/content}

{content for=domready}{literal}
	$("#id_file" ).sliceUpload({
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
