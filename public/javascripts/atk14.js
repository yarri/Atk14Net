var ATK14 = (function( $ ) {

	return {

		lang: $( "meta[name='x-lang']" ).attr( "content" ),

		action: $( "meta[name='x-action']" ).attr( "content" ),

		init: function() {
			$( "a[data-remote]" ).live( "click", function() {
				ATK14.handleRemote( this );
				return false;
			});
			$( "form[data-remote]" ).live( "submit", function() {
				ATK14.handleRemote( this );
				return false;
			});

			$( "body" )
				.ajaxStart(function() {
					$( this ).addClass( "loading" );
				})
				.ajaxStop(function() {
					$( this ).removeClass( "loading" );
				});

			$.ajaxSetup({
				converters: {
					"text atk14": true
				},
				dataType: "atk14"
			});
		},

		handleRemote: function( element ) {
			var method, url, data, $link, $form,
				$element = $( element ),
				dataType = $element.data( "type" ) || $.ajaxSettings.dataType;

			if ( $element.is("form") ) {
				$form = $element; // remove later
				method = $element.attr( "method" );
				url = $element.attr( "action" );
				data = $element.serializeArray();
			} else {
				$link = $element; // remove later
				method = $element.data( "method" );
				url = $element.attr( "href" );
				data = null;
			}

			$.ajax({
				url: url,
				type: method || 'GET',
				data: data,
				dataType: dataType,
				beforeSend: function(xhr, settings) {
					//return fire(element, 'ajax:beforeSend', [ xhr, settings ]);
				},
				success: function( data, status, xhr ) {
					$element.trigger( "ajax:success", [ data, status, xhr ] );

					if ( $.ajaxSettings.dataType === "atk14" ) {
						eval( data );
					}
				},
				complete: function( xhr, status ) {
					$element.trigger( "ajax:complete", [ xhr, status ] );
				},
				error: function( xhr, status, error ) {
					$element.trigger( "ajax:error", [ xhr, status, error ] );
				}
			});
		}
	};

})( jQuery );

jQuery(function() {
	ATK14.init();
});
