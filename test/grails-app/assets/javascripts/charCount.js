/*
 * 	Character Count Plugin - jQuery plugin
 * 	Dynamic character count for text areas and input fields
 *	written by Alen Grakalic	
 *	http://cssglobe.com/post/7161/jquery-plugin-simplest-twitterlike-dynamic-character-count-for-textareas
 *
 *	Copyright (c) 2009 Alen Grakalic (http://cssglobe.com)
 *	Dual licensed under the MIT (MIT-LICENSE.txt)
 *	and GPL (GPL-LICENSE.txt) licenses.
 *
 *	Built for jQuery library
 *	http://jquery.com
 *
 * 5/7/2013 Erica Findley - Modified to conform to standard plugin
 * format and added an update method for changing options after
 * initialization.
 *
 */
 
(function($) {
    /*** Private Function ***/
    var calculate = function(obj) {
        var data = $(obj).data('charCount');
        var count = $(obj).val().length;
        var available = data.allowed - count;
        if(available <= data.warning && available >= 0){
            $(obj).next().addClass(data.cssWarning);
        } else {
            $(obj).next().removeClass(data.cssWarning);
        }
        if(available < 0){
            $(obj).next().addClass(data.cssExceeded);
        } else {
            $(obj).next().removeClass(data.cssExceeded);
        }
        $(obj).next().html(data.counterText + available);
    };

    /*** Public Methods ***/
    var methods = {
        init : function(options) {
           var defaultOptions = { allowed: 140,
                warning: 25,
                css: 'counter',
                counterElement: 'div',
                cssWarning: 'warning',
                cssExceeded: 'exceeded',
                counterText: 'characters remaining: ' };

            return this.each(function() {
                var data = $(this).data('charCount');
                if(!data) {
                    data = $.extend(defaultOptions, options);
                    $(this).data('charCount', data);
                }
                $(this).after('<'+ data.counterElement +' class="' + data.css + '">'+ data.counterText +'</'+ data.counterElement +'>');
                calculate(this);
                $(this).on('keyup.charCount', function() {calculate(this);});
                $(this).on('change.charCount', function() {calculate(this);});
            });
        },
        update: function(options) {
            return this.each(function() {
                var data = $(this).data('charCount');
                data = $.extend(data, options);
                $(this).data('charCount', data);
                calculate(this);
            });
        }
    };

    /*** Plug-in Entry Point ***/
    $.fn.charCount = function(method){

        if ( methods[method] ) {
            return methods[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ));
        } else if ( typeof method === 'object' || ! method ) {
            return methods.init.apply( this, arguments );
        } else {
            $.error( 'Method ' +  method + ' does not exist on jQuery.charCount' );
        }

	};

})(jQuery);
