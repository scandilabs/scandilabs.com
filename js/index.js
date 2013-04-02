

$(document).ready(function() {
    $('.slideshow')    
    .after('<div id="nav">') 
    .cycle({
        fx: 'scrollLeft',
        /*next:   '.slideshow',*/ 
        timeout: 5000,
        pause: 1,
        speed: 1000,        
        pagerAnchorBuilder: function(index, el) {
          return '<div class="navItem"><a href="#">&nbsp;&nbsp;</a></div>';
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
