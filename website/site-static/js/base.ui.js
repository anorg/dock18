/*
 * BASE JAVASCRIPT
 * Functions defined here, global ones get called in js/init.php through "$(document).ready(function()"
 * However, the init functions can be modifyed in the application / templateing flow.
 */


function my_js_callback(data){
    // alert(data.message);
    $('#chat_p').html(data.message);
}

/* core */
var base = function() {
};

base.vars = {};
base.vars.section = 'none';

base.ui = function() {
};

base.log = function(message) {
	if (window.console) {
		console.log('[base] ' + message)
	}
}

base.ui.use_effects = true;

/* AJAX Indicator */
base.ui.loading = function() {
	$(document).ajaxStart(function() {
		$('div#toolbar_holder').addClass('active');
		$('body').addClass('ajax_loading');
	}).ajaxStop(function() {
		$('div#toolbar_holder').removeClass('active');
		$('body').removeClass('ajax_loading');
	});
};

/*
 * global interface things
 */
base.ui.iface = function() {
	
	Dajaxice.setup({
		'default_exception_callback': function() { 
			
			if(window.console) {
				// log
				console.log('ehm - unknown error. Something went wrong, but not too bad...', 'Dajaxice')
			}

		}
	});
	


	
	window.setInterval(base.ui.interval, 20000);
	// first toggle
	Dajaxice.ajax.loopcount(base.ui.refresh);

	
	
	// Prevent disabled / locked clicks
	$('.action_ a').live('click', function(e) {
		
		// console.log($(this).attr('href'));
		e.preventDefault();
		return false;
	});


	// hover / -out
	$('div.extend').hover(function(event) {
		$(this).addClass("hover");
	}, function(event) {
		$(this).removeClass("hover");
	});
	

	$('div.extend.event.listing').live('click', function(e) {
		
		var href = $('a.url_main', this).attr('href');
		window.location.href = href;
		
		e.preventDefault();
		return false;
	});
	
	
	// select
	$('div.listview.container div.list_body_row.selectable').live('click', function(event) {
		 
		if($(event.target).is("a") || $(event.target).is("img"))
		{
			//alert('no div');
		}
		else
		{
			$(this).toggleClass('selection');
			base.ui.listview.selection_update();
		}

	});
	

     
	base.plugins();
	base.feedback();
	
	$("div.holder.navigation ul.navigation-js").supersubs({ 
	    minWidth:    7, 
	    maxWidth:    17, 
	    extraWidth:  1 
	}).superfish();
	
	$('.hoverable').live('hover', function(e) {
		$(this).addClass("hover");
	});
	$('.hoverable').live('mouseleave', function(e) {
		$(this).removeClass("hover");
	});
	
	$('.linkable').live('click', function(e) {
		var href = $(this).find('a.permalink').attr('href');
		if(href) {
			$(window.location).attr('href', href);
		}
	});
	
	$('a.permalink').css('display', 'none');
	
	

};

base.ui.interval = function() {

	// Dajaxice.ajax.chat(base.ui.refresh);
	Dajaxice.ajax.loopcount(base.ui.refresh);
	
	
	$('#site_wide_announcements').load('/ #site_wide_announcements');
	
	// filebrowser
	$('#bcast_filebrowserpanel').load($(location).attr('href') + ' #bcast_filebrowserpanel');

	// reload comments | temporary here, refactor do djaxice
	// $('#comments_list').load('/shows/supershow/ #comments_list');
	
};

base.ui.refresh = function(data) {

	$(data.target).html(data.content);

};





base.feedback = function() {
	
    $('#id_feedback_form').live('submit', function(){
        var data = {};
        var feedback_url = $(this).attr('action');
        $(this).find(':input').each(function(){
            var key = $(this).attr('name');
            var value = $(this).attr('value');
            data[key] = value;
        });
        $.post(feedback_url, data, load_feedback);
        return false;
    });
};

function load_feedback(data, textStatus){
    $('#id_feedback_form').replaceWith(data).show();
}











base.plugins = function() {
	
	// global slideout
	$('#wrapper_feedback').tabSlideOut({
	    tabHandle: '.handle',                              //class of the element that will be your tab
	    pathToTabImage: '/static/img/base/text.feedback.png',          //path to the image for the tab *required*
	    imageHeight: '122px',                               //height of tab image *required*
	    imageWidth: '18px',                               //width of tab image *required*    
	    tabLocation: 'right',                               //side of screen where tab lives, top, right, bottom, or left
	    speed: 300,                                        //speed of animation
	    action: 'click',                                   //options: 'click' or 'hover', action to trigger animation
	    topPos: '29px',                                   //position from the top
	    fixedPosition: true                               //options: true makes it stick(fixed position) on scroll
	});

	$('#wrapper_feedback').removeClass('loading');
	// $('#wrapper_feedback form').addClass('uniForm');
	
	
	


	$(".announcment.action li.hide a").live("click", function(event) { 
		$(this).closest('div.container').fadeOut(500);
		$.get($(this).attr('href'), function() {});
		// event.preventDefault();
		return false;
	});
	
	
	
	
	
	
	
	
	
	
	/*
	 * Newsletter inlines
	 * TODO: Consider extending the app. For the moment it just is an ajax-wrapper to the existing app 
	 */
	var newsletter_container = $('#ajax_newsletter');
	newsletter_container.load('/newsletter/');
	$('a', newsletter_container).live("click", function(e) {
		e.preventDefault();
		var href = $(this).attr('href')
		newsletter_container.load(href);
		return false;
	});
	$(':submit', newsletter_container).live("click", function(e) {
		e.preventDefault();
		var form = $(this).parents('form');
		console.log(form);

		var url = form.attr('action');
		
		var data = {
			email_field: $('#id_email_field').val(),
			name_field: $('#id_name_field').val()
		};
		
		// look for hidden form-id mapings & checkboxes
		var values = {};
		$('input:hidden', newsletter_container).each(function(e){
			if($(this).attr('name').substr(0,4) == 'form') {
				values[$(this).attr('name')] = $(this).val();
			}
		});
		$('input:checkbox', newsletter_container).each(function(e){
			if($(this).attr('checked')) {
				values[$(this).attr('name')] = 'on';
			}
		});
		
		jQuery.extend(data, values);
		
		
		console.log(data);
		
		$.ajax({
		  type: 'POST',
		  url: url,
		  data: data,
		  success: function(data) {
  			newsletter_container.html(data);
		},
		});
		
		
		
		return false;
	});
	
	

	
	$('[title]').qtip({
	   position: {
	      my: 'bottom center',  // Position my top left...
	      at: 'top center', // at the bottom right of...
	      adjust: {
         	method: 'flip flip'
      		}
	   },
	   
	});
	
	
};


// player
base.player = function() {};
base.player.init = function() {
	
	base.log('player init');
	
	this.track = function(action, event) {
		var item = jwplayer().getPlaylist(event.index)
		_gaq.push(['_trackEvent', 'stream', action, item[0].file]);
	}
	
	this.metadata = function(event) {
		
		var item = jwplayer().getPlaylist(event.index)		
		
		var description = util.parse_description(item[event.index].description, true);
		
		if(description) {
			$('#cuepoints').html('<p>' + description + '</p>');
			$('#cuepoints').show();
		} else {
			$('#cuepoints').hide();
		}

	}
	
	this.seek_anchor = function(event) {
	var anchor = window.location.hash.replace("#", "");
	
		if(anchor) {
			base.player.seek(anchor);
		}
		
	};
	
	

	
 	
	$('a.cuepoint').live("click", function(){ 
		
		var pos_str = $(this).attr('href').split('#')[1];
		base.player.seek(pos_str);
		// return false;
		
	});  

	return this;
	
};


base.player.seek = function(pos_str) {
	
		var pos = pos_str.split(':');
		var pos_num = parseFloat((60 * pos[0])) + parseFloat(pos[1]);
		jwplayer().seek(pos_num);
		
		return pos_num;
};

base.player.setup = function() {

};




/*
 * uploader things
 */
base.ui.uploader = function() {
	

	
	var uploader = $("#uploader").plupload( {
		// General settings
		runtimes : 'flash,html5,browserplus,silverlight,gears,html4',
		url : 'http://2011.poollooq.ch/ajax/upload',
		max_file_size : '2000mb',
		max_file_count : 200, // user can add no more then 200 files at a time
		chunk_size : '1mb',
		//chunk_size : false,
		unique_names : false,
		multiple_queues : true,

		// Resize images on clientside if we can
		
		/*resize : {
			width : 320,
			height : 240,
			quality : 90
		},
		*/

		// Rename files by clicking on their titles
		rename : true,

		// Sort files
		sortable : true,

		// Specify what files to browse for
		filters : [ {
			title : "Image files",
			extensions : "jpg,gif,png,psd,tif,tiff"
		}, {
			title : "Zip files",
			extensions : "zip,avi,dmg,iso,rar"
		} , {
			title : "Audio files",
			extensions : "wav,aiff,mp3,ogg,flac"
		} , {
			title : "Text files",
			extensions : "txt,pdf,doc,docx,rtf"
		} , {
			title : "Video files",
			extensions : "avi,mpg,mov"
		} ],

		// Flash settings
		flash_swf_url : '/media/js/lib/plupload/plupload.flash.swf',

		// Silverlight settings
		silverlight_xap_url : '/media/js/lib/plupload/js/plupload.silverlight.xap'
	});
	
	
	
	// Listeners for input
	$('input.on_change').live('change', function(e) {
		base.ui.uploader.update_values();
	});
	
	
	base.ui.uploader.update_values();
	
	
	$('.plupload_header_content').live('change', function(e) {
			alert('chane');
	});
	
	

	// Client side form validation
	$('form').submit(function(e) {
		
		
		var uploader = $('#uploader').pluploadQueue('getUploader');
		
		uploader.settings.multipart_params = {datafield: 'mydata'};

		// Validate number of uploaded files
			if (uploader.total.uploaded == 0) {
				// Files in queue upload them first
				if (uploader.files.length > 0) {
					// When all files are uploaded submit form
					uploader.bind('UploadProgress', function() {
						if (uploader.total.uploaded == uploader.files.length)
							$('form').submit();
					});

					uploader.start();
				} else
					alert('You must at least upload one file.');

				e.preventDefault();
			}
		});
	
	/**/
	
	base.vars.section = 'upload-disabled';
	
	

	
	
	if(base.vars.section == 'upload')
	{
		// $('#listing').load('/ajax/upload_listing');
		
		
		
		// sections to refresh
		$('#listing').smartupdater( {
			url : 'http://web.devel.poollooq.ch/ajax/upload_listing',
			minTimeout : 5000,
			multiplier : 2
		}, 
        function (data) { 
            $('#listing').html(data); 
       });
		
		
	}
	

};




base.ui.uploader.update_values = function() {
	
	// reference to uploader
	var uploader = $('#uploader').plupload('getUploader');

	var nickname = $('input[name=nickname]').val();
	var email = $('input[name=email]').val();
	var project = $('input[name=project]').val();
	var description = $('input[name=description]').val();
	var skype = $('input[name=skype]').val();

	var data = {
			nickname : nickname,
			email : email,
			project : project,
			description : description,
			skype : skype
	};
	
	uploader.settings.multipart_params = data;

	
	// Reset start button
	$('#uploader_start').css('display', 'none');
	if(nickname && email) {
		$('#uploader_start').css('display', 'inline-block');
	}
	
	

	
};







/*
 * AJAX wrapper Generic UI ajax wrapper
 */
base.ui.ajax = function(url, data) {

	// Add to tracking queue
	if (base.vars.ga_track_events) {
		_gaq.push( [ '_trackEvent', 'AJAX', 'call', url ]);
	}

	// AJAX Call
	$.ajax( {
		url : url,
		type : "POST",
		data : data,
		dataType : "json",
		success : function(result) {
			if (true == result['status']) {
				// Display jGrowl message
		if (result['message']) {
			base.ui.ui_message(result['message'], 10000);
		}
		// Display Dialog
		if (result['dialog']) {
			base.ui.dialog_static(result['dialog']);
		}
		// Reload the current page
		if (result['action'] == 'reload') {
			window.location.reload();
		}
		// Redirect to the given location
		if (result['redirect']) {
			window.location = result['redirect'];
		}
		// Reset pageing counter to 1
		if ('reset_page' == result['action']) {
			var uri = util.uri_param_insert(window.location.href, 'page', 1,
					true);
			window.location = uri;
		}
	} else {
		if (result['message']) {
			base.ui.ui_message(result['message']);
		}
		if (result['dialog']) {
			base.ui.dialog_static(result['dialog']);
		}
	}
},
error : function(XMLHttpRequest, textStatus, errorThrown) {
	base.ui.ui_message(errorThrown);
}
	});
};

















/*
 * Utility functions
 */
util = function() {
};
util.uri_param_insert = function(sourceUrl, parameterName, parameterValue,
		replaceDuplicates) {

	if ((sourceUrl == null) || (sourceUrl.length == 0))
		sourceUrl = document.location.href;
	var urlParts = sourceUrl.split("?");
	var newQueryString = "";
	if (urlParts.length > 1) {
		var parameters = urlParts[1].split("&");
		for ( var i = 0; (i < parameters.length); i++) {
			var parameterParts = parameters[i].split("=");
			if (!(replaceDuplicates && parameterParts[0] == parameterName)) {
				if (newQueryString == "")
					newQueryString = "?";
				else
					newQueryString += "&";
				newQueryString += parameterParts[0] + "=" + parameterParts[1];
			}
		}
	}
	if (newQueryString == "")
		newQueryString = "?";
	else
		newQueryString += "&";
	newQueryString += parameterName + "=" + parameterValue;

	return urlParts[0] + newQueryString;
};

util.string_random = function(length) {

	var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz'
			.split('');

	if (!length) {
		length = Math.floor(Math.random() * chars.length);
	}

	var str = '';
	for ( var i = 0; i < length; i++) {
		str += chars[Math.floor(Math.random() * chars.length)];
	}
	return str;
};


util.parse_description = function(text, convert_linebreaks) {

	if(text.length < 1) {
		return false;
	}

    var re = / (([0-9]{2}):[0-9]{2})/g;        
    text = text.replace(re, ' <a class="cuepoint" href="#$1">$1</a>');
    
    if(convert_linebreaks) {
    	text = text.replace(/\n/g,'<br />'); 
	}
	
	
	return text;
}







$.fn.serializeObject = function()

{
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name]) {
			if (!o[this.name].push) {
				o[this.name] = [ o[this.name] ];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
};





















/*
 * AJAX CSRF handling
 */

$(document).ajaxSend(function(event, xhr, settings) {
    function getCookie(name) {
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        // alert(cookieValue);
        return cookieValue;
    }
    function sameOrigin(url) {
        // url could be relative or scheme relative or absolute
        var host = document.location.host; // host + port
        var protocol = document.location.protocol;
        var sr_origin = '//' + host;
        var origin = protocol + sr_origin;
        // Allow absolute or scheme relative URLs to same origin
        return (url == origin || url.slice(0, origin.length + 1) == origin + '/') ||
            (url == sr_origin || url.slice(0, sr_origin.length + 1) == sr_origin + '/') ||
            // or any other URL that isn't scheme relative or absolute i.e relative.
            !(/^(\/\/|http:|https:).*/.test(url));
    }
    function safeMethod(method) {
        return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
    }

    if (!safeMethod(settings.type) && sameOrigin(settings.url)) {
        xhr.setRequestHeader("X-CSRFToken", getCookie('csrftoken'));
    }
});