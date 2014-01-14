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

(function($) {
    $(function() {
        $('.jcarousel').jcarousel({
          wrap: 'circular',
          scroll: 1
        });

        $('.jcarousel-control-prev')
            .on('jcarouselcontrol:active', function() {
                $(this).removeClass('inactive');
            })
            .on('jcarouselcontrol:inactive', function() {
                $(this).addClass('inactive');
            })
            .jcarouselControl({
                target: '-=1'
            });

        $('.jcarousel-control-next')
            .on('jcarouselcontrol:active', function() {
                $(this).removeClass('inactive');
            })
            .on('jcarouselcontrol:inactive', function() {
                $(this).addClass('inactive');
            })
            .jcarouselControl({
                target: '+=1'
            });

        $('.jcarousel-pagination')
            .on('jcarouselpagination:active', 'a', function() {
                $(this).addClass('active');
            })
            .on('jcarouselpagination:inactive', 'a', function() {
                $(this).removeClass('active');
            })
            .jcarouselPagination();
    });
})(jQuery);

$(document).ready(function() {


    $('#staffPics').cycle({ 
      fx:    'scrollDown', 
      speed:  500, 
      timeout: 2000
    });
    
    /*
    $('#clientLogos').jcarousel({
        wrap: 'circular',
        scroll: 1
    });    
    */
    
    $('.slideBlackBox').hover(function() {
        showSlideNav();  
    }, function() {
        $('.slideNav').hide();
        slideNavHover = false;
    });
    
    $('.slideNav').hover(function() {
        showSlideNav();  
    }, function() {
        $('.slideNav').hide();
        slideNavHover = false;
    });    
    
    $('.nextSlideNav').click(function() {
        handleSlideNavClick();
    });
    
    $('.prevSlideNav').click(function() {
        handleSlideNavClick();      
    });
    
    
    $('.slideshow')    
    .after('<div id="nav">') 
    .cycle({
        fx: 'scrollHorz',
        next: '.nextSlideNav',
        prev: '.prevSlideNav',
        timeout: 0,
        pause: 0,
        speed: 1000,        
        pagerAnchorBuilder: function(index, el) {
          return '<div class="navItem"><a href="#">&nbsp;&nbsp;</a></div>';
          //return '';
        },
        pager: '#nav', 
        after: function(currSlideElement, nextSlideElement, options, forwardFlag) {

            // Re-enable nav links            
            slideNavEnabled = true;
            
            // Show nav if we're currently hovering
            if (slideNavHover == true) {
                showSlideNav();
            }
            if (options.currSlide > 0) {
                
                // Capture navigation to any slide but the first as a google analytics event
                var eventName = "NavigateToSlide" + (options.currSlide + 1);
                var label = "Showing slide " + (options.currSlide + 1);
                _gaq.push(['_trackEvent', 'index_slider', eventName, '" + label + "']);
            }
        },
        before: function(currSlideElement, nextSlideElement, options, forwardFlag) {  
            $('.slideNav').hide();            
            slideNavEnabled = false;
        }
    });
    
    $('.centeredTableCell').mouseenter(
        function() {
            $(this).parent().addClass("hover");
            //alert('hia ' + el);
        }
    ).mouseleave( 
        function() {
            $(this).parent().removeClass("hover");
            //alert('hi');
        }
    );
    
    /*
    $('.centeredTableCell').click(
        function() {
            alert('hia ');
        }
    );
    */
});
