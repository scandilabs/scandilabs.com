var slideNavEnabled = true;
var slideNavHover = false;

/**
 * Used to disable slide nav while it is transitioning 
 * (avoids nav appearing during transitions)
 */
function handleSlideNavClick() {
    $('.slideNav').hide();
    slideNavHover = true;
    slideNavEnabled = false;
}

function showSlideNav() {
    if (slideNavEnabled == true) {
        $('.slideNav').show();   
    }
    slideNavHover = true;
}

/* http://www.gmarwaha.com/jquery/jcarousellite/?#doc */
$(function() {
    $(".clientLogoContainer").jCarouselLite({
        btnNext: '.next',
        btnPrev: '.prev',
        visible: 4,
        speed: 500,
        easing: 'easeInOutCubic',
        circular: true
    });
});

$(document).ready(function() {

    $('#staffPics').cycle({ 
      fx:    'zoom', 
      speed:  1000,
      timeout: 5000
    });
    
});
