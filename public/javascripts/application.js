/* global window */
(function( window, $, undefined ) {
	var document = window.document,

	SKELET = {
		common: {
			init: function() {
				// application-wide code

				// Source code modals.
				$( ".documentation a[data-remote='true']" ).on( "ajax:success", function(jqEvent, html) {
					bootbox.dialog({
						message: html,
						title: $(html).data( "title" ),
						className: "modal-docs",
						onEscape: function() {
							bootbox.hideAll();
						}
					});
				});
			}
		},

		remote_links: {
			index: function() {
				$( "#json_link" ).on( "ajax:success", function(ev, json) {
					var $this = $( this );
					var $ul = $this.next( "ul" );
					if (!$ul.length) {
						$ul = $( "<ul></ul>" ).insertAfter($this);
					}
					$.each( json, function(key, val) {
						$ul.append( "<li>" + key + ": " + val + "</li>" );
					});
				});
			}
		},

		sign_up_js_validation: {
			sign_up: function() {
				$.validator.addMethod( "regex", function(value, element, regexp) {
					// regexp comes here as '/^[a-z]{1,5}$/i'
					// it must be splitted to: pattern='^[a-z]{1,5}', modifiers='i'
					var matches = regexp.match(/\/(.*)\/([^\/]*)/),
						pattern = matches[ 1 ],
						modifiers = matches[ 2 ],
						re = new RegExp( pattern,modifiers );

					return this.optional( element ) || re.test( value );
				}, "Please check your input.");

				// validate signup form on keyup and submit
				var $form = $( "form" ),
					rules = $form.data( "validation-rules" ),
					messages = $form.data( "validation-messages" );

				$form.validate({
					rules: rules,
					messages: messages,
					// the errorPlacement has to take the table layout into account
					errorPlacement: function( error, element ) {
						if ( element.is( ":radio" ) ) {
							error.appendTo( element.parent().next().next() );
						} else if ( element.is( ":checkbox" ) ) {
							error.appendTo ( element.next() );
						} else {
							error.appendTo( element.parent() );
						}
					},
					errorElement: "p",
					// set this class to error-labels to indicate valid fields
					success: function(label) {
						label.html("Ok").addClass("checked");
					}
				});
			}
		},

		users: {
			init: function() {
				// controller-wide code
			},

			create_new: function() {
				// action-specific code

				/*
				 * Check whether login is available.
				 * Simple demo of working with an API.
				 */
				var $login = $( "#id_login" ),
					$status = $( "<p class='alert alert-danger col-sm-4 col-sm-offset-2'>Username is already taken.</p>" ).hide().appendTo( $login.closest(".form-group") );

				$login.on( "change", function() {
					// Login input value to check.
					var value = $login.val(),
					// API URL.
						url = "/api/" + $( "html" ).attr( "lang" ) + "/login_availabilities/detail/",
					// GET values for API. Available formats: xml, json, yaml, jsonp.
						data = {
							login: value,
							format: "json"
						};

					// AJAX request to the API.
					if ( value !== "" ) {
						$.ajax({
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
						});
					}
				}).change();
			}
		}
	};

	/*
	 * Garber-Irish DOM-based routing.
	 * See: http://goo.gl/z9dmd
	 */
	SKELET.UTIL = {
		exec: function( controller, action ) {
			var ns = SKELET;

			if ( action === undefined ) {
				action = "init";
			}

			if ( controller !== "" && ns[controller] && typeof ns[controller][action] === "function" ) {
				ns[controller][action]();
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
	$( document ).ready( SKELET.UTIL.init );
})( window, window.jQuery );
