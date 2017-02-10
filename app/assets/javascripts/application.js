//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require frontend/cycle2
//= require frontend/slicknav

/*body remove jerk when nav sticky*/
jQuery(function($) {

    var $nav = $('#header');
    var $win = $(window);
  	var windowHeight = $(window).height();
    var winH = 100

    $win.on("scroll", function () {
        if ($(this).scrollTop() > winH ) {
            $nav.addClass("header-sticky");
  					$("body").addClass("body-sticky");
        } else {
            $nav.removeClass("header-sticky");
  					$("body").removeClass("body-sticky");
        }
    }).on("resize", function(){ // If the user resizes the window
       winH = $(this).height(); // you'll need the new height value
    });

});

$(document).ready(function() {
	var limit =$('.logo-nav').height() + $('.site-nav').height() + $('.banner').height();
	var exceed_limit = ($('body').height()) - (limit + 1490);

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

$(document).ready(function() {

var scrollLogo = 100;

	$(window).scroll(function() {
		var scrollValue = $(this).scrollTop();

		if(scrollValue > scrollLogo) {
			$(".logo-unsticky").addClass("logo-sticky");
			$("logo-sticky").css('transition', 'all ease 0.2s')
			
		} else {
			$(".logo-unsticky").removeClass("logo-sticky");
		}            
	});



});