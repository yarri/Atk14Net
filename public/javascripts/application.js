$(function() {
	$( "#json_link" ).bind( "ajax:success", function(ev, data) {
		var $this = $(this);
		var $ul = $this.next( "ul" );
		if (!$ul.length) {
			$ul = $("<ul></ul>").insertAfter($this);
		}
		$.each(data, function(key, val) {
			$ul.append("<li>"+key+": "+val+"</li>");
		});
	});
});
