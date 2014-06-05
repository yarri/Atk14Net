<h1>{$page_title}</h1>

<p class="lead">On this page you can easily upload a really big file (e.g. 1GB) to the server. File will be split up to 1MB chunks using HTML5 File API and AJAX. The md5 sum will be displayed after a successful file upload.</p>

{render partial=form}
