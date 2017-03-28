/* global window */
( function( window, $, undefined ) {
	"use strict";
	var document = window.document,

	SKELET = {
		common: {

			// Application-wide code.
			init: function() {

				// Source code modals.
				$( ".documentation a[data-remote='true']" ).
				on( "ajax:success", function( jqEvent, html ) {
					window.bootbox.dialog( {
						message: html,
						title: $( html ).data( "title" ),
						className: "modal-docs",
						onEscape: function() {
							window.bootbox.hideAll();
						}
					} );
				} );
			}
		},

		chunked_file_uploads: {
			create_new: function() {
				/*
				$( "#id_file" ).sliceUpload( {
					chunkSize: 1024*1024,
					fileLoaded: function( responseText ){
						if (responseText.length>0) {
							eval(responseText);
							return false;
						}
						return true;
					}
				} );
				*/

				var $progress = $( ".progress-bar" ),
					$list = $( ".table tbody" );

				$( "#id_file" ).fileupload( {
					maxChunkSize: 1024 * 1024,
					multipart: false,
					dataType: "json",
					done: function( e, data ) {
						$list.parents( "table.hide" ).hide().removeClass( "hide" ).fadeIn( "slow" );
						$( "<tr><td>" + data.result.filename + "</td><td>" + data.result.filesize +
						"</td><td>" + data.result.checksum + "</td></tr>" ).appendTo( $list );
						$progress.attr( "aria-valuenow", 0 ).css( "width", 0 );
					},
					progressall: function( e, data ) {
						var progress = parseInt( data.loaded / data.total * 100, 10 );

						$progress.attr( "aria-valuenow", progress ).css( "width", progress + "%" );
					}
				} );
			}
		},

		remote_links: {
			index: function() {
				$( "#json_link" ).on( "ajax:success", function( ev, json ) {
					var $this = $( this ),
						$ul = $this.next( "ul" );
					if ( !$ul.length ) {
						$ul = $( "<ul></ul>" ).insertAfter( $this );
					}
					$.each( json, function( key, val ) {
						$ul.append( "<li>" + key + ": " + val + "</li>" );
					} );
				} );
			}
		},

		sign_up_js_validation: {
			sign_up: function() {
				$.validator.addMethod( "regex", function( value, element, regexp ) {

					// Regexp comes here as '/^[a-z]{1,5}$/i'
					// It must be splitted to: pattern='^[a-z]{1,5}', modifiers='i'
					var matches = regexp.match( /\/(.*)\/([^\/]*)/ ),
						pattern = matches[ 1 ],
						modifiers = matches[ 2 ],
						re = new RegExp( pattern, modifiers );

					return this.optional( element ) || re.test( value );
				}, "Please check your input." );

				// Validate signup form on keyup and submit
				var $form = $( "form" ),
					rules = $form.data( "validation-rules" ),
					messages = $form.data( "validation-messages" );

				$form.validate( {
					rules: rules,
					messages: messages,

					// The errorPlacement has to take the table layout into account
					errorPlacement: function( error, element ) {
						if ( element.is( ":radio" ) ) {
							error.appendTo( element.parent().next().next() );
						} else if ( element.is( ":checkbox" ) ) {
							error.appendTo( element.next() );
						} else {
							error.appendTo( element.parent() );
						}
					},
					errorElement: "p",

					// Set this class to error-labels to indicate valid fields
					success: function( label ) {
						label.html( "Ok" ).addClass( "checked" );
					}
				} );
			}
		},

		users: {

			// Controller-wide code.
			init: function() {
			},

			// Action-specific code
			create_new: function() {
				/*
				 * Check whether login is available.
				 * Simple demo of working with an API.
				 */
				var $login = $( "#id_login" ),
					m = "Username is already taken.",
					h = "<p class='alert alert-danger col-sm-4 col-sm-offset-2'>" + m + "</p>",
					$status = $( h ).hide().appendTo( $login.closest( ".form-group" ) );

				$login.on( "change", function() {

					// Login input value to check.
					var value = $login.val(),
						lang = $( "html" ).attr( "lang" ),

					// API URL.
						url = "/api/" + lang + "/login_availabilities/detail/",

					// GET values for API. Available formats: xml, json, yaml, jsonp.
						data = {
							login: value,
							format: "json"
						};

					// AJAX request to the API.
					if ( value !== "" ) {
						$.ajax( {
							dataType: "json",
							url: url,
							data: data,
							success: function( json ) {
								if ( json.status !== "available" ) {
									$status.fadeIn();
								} else {
									$status.fadeOut();
								}
							}
						} );
					}
				} ).change();
			}
		}
	};

	/*
	 * Garber-Irish DOM-based routing.
	 * See: http://goo.gl/z9dmd
	 */
	SKELET.UTIL = {
		exec: function( controller, action ) {
			var ns = SKELET,
				c = controller,
				a = action;

			if ( a === undefined ) {
				a = "init";
			}

			if ( c !== "" && ns[ c ] && typeof ns[ c ][ a ] === "function" ) {
				ns[ c ][ a ]();
			}
		},

		init: function() {
			var body = document.body,
			controller = body.getAttribute( "data-controller" ),
			action = body.getAttribute( "data-action" );

			SKELET.UTIL.exec( "common" );
			SKELET.UTIL.exec( controller );
			SKELET.UTIL.exec( controller, action );
		}
	};

	// Expose SKELET to the global object.
	window.SKELET = SKELET;

	// Initialize application.
	SKELET.UTIL.init();
} )( window, window.jQuery );
