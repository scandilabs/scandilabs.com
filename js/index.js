

$(document).ready(function() {
    
    /*
    $('.nextSlideNav').click(function() {
        $('.slideshow').cycle('next');      
    });
    
    $('.prevSlideNav').click(function() {
        $('.slideshow').cycle('prev');      
    });
    */
    
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
        pager: '#nav'
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
