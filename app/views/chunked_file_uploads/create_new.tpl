<h1>{$page_title}</h1>

<p class="lead">On this page you can easily upload a really big file (e.g. 1GB) to the server. File will be split up to 1MB chunks using HTML5 File API and AJAX. The md5 sum will be displayed after a successful file upload.</p>

{render partial=form}

{*
{content for=js_script_tags}
		{javascript_script_tag file="libs/modernizr/modernizr-1.6.min.js"}
		{javascript_script_tag file="libs/plugins/jquery.fileupload.js"}
		{javascript_script_tag file="libs/plugins/jquery.sliceupload.js"}
{/content}

{content for=domready}
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
{/content}
*}
