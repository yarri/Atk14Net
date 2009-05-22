function noSpamFilter(){
	$('.atk14_no_spam').each(function(i){
		var el = $(this);
		var address = el.html();
		address = address.replace("[at-sign]","@");
		address = address.replace("[dot-sign]",".");
		el.html('<a href="mailto:'+address+'">'+address+'</a>');
		el.removeClass('atk14_no_spam');		
	});
}

function randomizeUrlForAjax(url){
	if(url.indexOf('?')>0){
		url = url + '&';
	}else{
		url = url + '?';
	}
	url = url + '_=' + (Math.random());
	return url;
}

function evaluateSourceForRemoteLink(source,$link){
	eval(source);
}
function evaluateSourceForRemoteForm(source,$form){
	eval(source);
}

var remote_link = function(){
	if($(this).hasClass("confirm") && !confirm("Opravdu?")){
		return false;
	}
	// existuje nejaka alternativni callback fce pro remote_link?
	if (typeof before_remote_link != "undefined") {
			// ano. spustme ji...
			var ret = before_remote_link($(this));
			if (ret !== null) {
					// before_remote_link vykonala nejakou akci, koncime
					return ret;
			}
			// before_remote_link vratilo null, coz znamena, ze ma 
			// byt provedena originalni akce (viz nize)
	}
	$('body').css('cursor','wait');
	var method = 'GET';
	var data = undefined;
	if($(this).hasClass("remote_post_link")){
		method = 'POST';
		data = ''; // Toto vynuti nastaveni hlavicky Content-Length: 0
	}
	$.ajax({
		$link: $(this),
		cache: false,
		type: method,
		data: data,
		url: $(this).attr('href'),
		dataType: 'text',
		complete: function(){
			$('body').css('cursor','default');
			noSpamFilter();
		},
		success: function(source){
			evaluateSourceForRemoteLink(source,this.$link);
			// existuje nejaka alternativni callback fce pro remote_link?
			if (typeof after_remote_link != "undefined") {
					// ano. spustme ji...
					after_remote_link(this.$link);
			}
		}
	});
	$(this).blur();
	return false;
}

var remote_form = function(){
	$('body').css('cursor','wait');
	$.ajax({
		$form: $(this),
		cache: false,
		type: 'POST',
		url: randomizeUrlForAjax($(this).attr('action')),
		dataType: 'text',
		data: $(this).serialize(),
		complete: function(){
			$('body').css('cursor','default');
			noSpamFilter();
		},
		success: function(source){
			evaluateSourceForRemoteForm(source,this.$form);
		}
	});
	return false;
}

$(document).ready(function(){
	noSpamFilter();
});

$('a.remote_link, a.remote_post_link').livequery('click',remote_link);
$('form.remote_form').livequery('submit',remote_form);
