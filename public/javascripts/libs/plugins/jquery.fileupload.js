(function($) {
	Modernizr.addTest('fileapi', function() {
		return !!window.FileReader;
	});

	$.fn.fileUpload = function(userOptions) {
		if (!Modernizr.draganddrop || !Modernizr.fileapi) {
			return;
		}

		var options = $.extend({}, $.fn.fileUpload.defaultOptions, userOptions);

		return this.each(function() {
			var $upload = $(this).data('options', options);
			var $form = $upload.closest('form').addClass('dnd_droppable');

			$form.bind({
				'dragenter': function() {
					$(this).addClass('dragging');
					return false;
				},
				'dragover': function() {
					return false;
				},
				'drop': function(ev) {
					$(this).removeClass('dragging');
					handleFile.call($upload[0], ev.originalEvent.dataTransfer.files, 0);
					return false;
				}
			});

			$form.bind( "submit", function() {
				handleFile.call( $upload[0], $upload[0].files, 0 );
				return false;
			});
		});
	};

	$.fn.fileUpload.defaultOptions = {
		mimeType: /image.*/,
		dataType: 'json',
		loadStart: function(e, num_files, i) {
			if (i == 0) {
				$('body').addClass('loading');
				$(this).data('progress', $('<div />').insertAfter($(this).closest('form')).progressbar({ value: 0 }));
			}
			else {
				var percent = calcTotalProgress(e,num_files,i) || $(this).data('progress').progressbar('value');
				$(this).data('progress').progressbar({ value: percent });
			}
		},
		progress: function(e, num_files, i) {
			var percent = calcTotalProgress(e,num_files,i) || $(this).data('progress').progressbar('value');
			$(this).data('progress').progressbar({ value: percent });
		},
		load: function(e, num_files, i) {
			var percent = calcTotalProgress(e,num_files,i) || $(this).data('progress').progressbar('value');
			$(this).data('progress').progressbar({ value: percent });
			if (i == (num_files - 1)) {
				$(this).data('progress').fadeOut().progressbar('destroy');
				$('body').removeClass('loading');
			}
		},
		fileLoaded: function(responseText) {}
	};

	function calcTotalProgress(e, num_files, i) {
		if (e.lengthComputable) {
			return ((i/num_files)+((e.loaded/e.total)*(1/num_files)))*100;
		}
		else {
			return false;
		}
	};

	function handleFile(filelist, i) {
		var file = filelist[i];
		var $upload = $(this);
		var options = $upload.data('options');
		var num_files = $upload.attr('multiple') ? filelist.length : 1;

		if (!file.type.match(options.mimeType)) {
			if (filelist[i+1] && $upload.attr('multiple')) {
				handleFile.call(this, filelist, i+1);
			}
			return;
		}

		var xhr = new XMLHttpRequest();
		// progress listeners triggering callbacks set in options
		xhr.upload.addEventListener('loadstart', function(event) {
			options.loadStart.call($upload[0], event, num_files, i);
		}, false);
		xhr.upload.addEventListener('progress', function(event) {
			options.progress.call($upload[0], event, num_files, i);
		}, false);
		xhr.upload.addEventListener("load", function(event) {
			options.load.call($upload[0], event, num_files, i);
		}, false);
		// xhr connection
		xhr.open('POST', $upload.closest('form').attr('action'), true);
		xhr.setRequestHeader("Content-Type", file.type);
		xhr.setRequestHeader("X-File-Name", file.name);
		xhr.setRequestHeader("X-Requested-With", "xmlhttprequest");
		// handling response, again triggering callback from options
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					if (options.dataType == 'json') {
						options.fileLoaded.call($upload[0], $.parseJSON(xhr.responseText));
					}
					else {
						options.fileLoaded.call($upload[0], xhr.responseText);
					}
					if (filelist[i+1] && $upload.attr('multiple')) {
						handleFile.call($upload[0], filelist, i+1);
					}
					ATK14.attachBehaviors();
				}
			}
		};
		xhr.send(file);
	}
})(jQuery);
