// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require markdown
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation(); });

//VST
$(document).ready (function(){
	$('.comments-block').click(function() {
  		var strNameId = 'cw ' + $(this).attr('id').split(' ').pop();
  		$(document.getElementById(strNameId)).slideToggle('slow');
	});


	//if ()
		$("#convert_post_title").text($('#post_title').val());
		$("#convert_post_text").append(markdown.toHTML($('#post_text').val(), 'Maruku'));
	//}

	$(function(){
  		$('#post_title').keyup(function(){
     		$('#convert_post_title').text($(this).val());
  		});
	});
	$(function(){
  		$('#post_text').keyup(function(){
  			$("#convert_post_text").empty();
			$("#convert_post_text").append(markdown.toHTML($('#post_text').val(), 'Maruku'));
  		});
	});
});

