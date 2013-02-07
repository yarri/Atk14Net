(function($) {
	Modernizr.addTest('fileapi', function() {
		return !!(window.File && (File.prototype.mozSlice || File.prototype.slice));
	});

	$.fn.sliceUpload = function(userOptions) {
		if (!Modernizr.draganddrop || !Modernizr.fileapi) {
			return this;
		}

		var options = $.extend({}, $.fn.sliceUpload.defaultOptions, userOptions);

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
					handleFile.call($upload[0], ev.originalEvent.dataTransfer.files[0]);
					return false;
				}
			});

			$form.bind( "submit", function() {
				handleFile.call( $upload[0], $upload[0].files[0] );
				return false;
			});
		});
	};

	$.fn.sliceUpload.defaultOptions = {
		mimeType: /image.*/,
		dataType: 'json',
		chunkSize: 1048576, // 1MB
		statusExpected: 200, // unset this option to handle all responses by yourself (vital for rest apis)
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

		// if fileLoaded() returns false, the upload will not continue
		fileLoaded: function(responseText, responseCode) { return true; }
	};

	function calcTotalProgress(e, num_files, i) {
		if (e.lengthComputable) {
			return ((i/num_files)+((e.loaded/e.total)*(1/num_files)))*100;
		}
		else {
			return false;
		}
	};

	function handleFile( file ) {
		var $upload = $(this),
			options = $upload.data('options'),
			chunkSize = options.chunkSize,
			chunksNum = Math.ceil( file.size / chunkSize );
		file.token = ( new Date() ).getTime();

		handleChunk.call( this, file, chunkSize, chunksNum, 0 );
	};

	function handleChunk( file, size, num_files, i ) {
		var $upload = $( this ),
			options = $upload.data('options'),
			next = i + 1,
			chunk;

		if ( File.prototype.slice ) {
			chunk = file.slice( i*size, i*size + size );
		} else if ( File.prototype.mozSlice ) {
			chunk = file.mozSlice( i*size, i*size + size );
		} else if ( File.prototype.webkitSlice ) {
			chunk = file.webkitSlice( i*size, i*size + size );
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
		xhr.setRequestHeader("X-File-Size", file.size);
		xhr.setRequestHeader("X-File-Token", file.token);
		xhr.setRequestHeader("X-File-Chunk", next + "/" + num_files ); // 1/3, 2/3 and 3/3
		xhr.setRequestHeader("X-Requested-With", "xmlhttprequest");
		// handling response, again triggering callback from options
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (!options.statusExpected || xhr.status == options.statusExpected) {
					if(options.fileLoaded.call($upload[0], xhr.responseText, xhr.status)==false) {
						return;
					}

					if ( next < num_files ) {
						handleChunk.call( $upload[0], file, size, num_files, next );
					}

					if ( $.isFunction(ATK14.attachBehaviors) ) {
						ATK14.attachBehaviors();
					}
				}
			}
		};
		xhr.send(chunk);
	};
})(jQuery);
