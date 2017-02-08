//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require frontend/cycle2
//= require frontend/slicknav

$(document).ready(function() {
	var limit =$('.logo-nav').height() + $('.site-nav').height() + $('.banner').height();
	var exceed_limit = ($('body').height()) - (limit + 1165);

	$(window).scroll(function() {
		var scrollVal = $(this).scrollTop();

		if(scrollVal > limit) {
			$(".form-container").addClass("fixed_form");
			if(scrollVal > exceed_limit) {
				$(".form-container").addClass("unfix_form");	
			} else {
				$(".form-container").removeClass("unfix_form");
			}
		} else {
		$(".form-container").removeClass("fixed_form");
		}            
	});

	// Show nocar image incase any image is broken
	$("img").error(function () {
  	$(this).unbind("error").attr("src", "/no-car.png");
	});
	// $('select option')
 //    .filter(function() {
 //        return !this.value || $.trim(this.value).length == 0;
 //    })
 //   .remove();
 //   // $("select").prepend("<option value=''>-- Select Filter --</option>").val('');


});