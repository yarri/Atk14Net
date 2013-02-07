var $dialog = $("<div>" + {jstring}{render partial=detail}{/jstring} + "</div>").dialog({
	modal: true,
	width: $(window).width() * 0.9,
	height: $(window).height() * 0.9,
	title: {jstring}{$page_title}{/jstring}
});
