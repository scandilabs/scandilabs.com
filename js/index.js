

$(document).ready(function() {
    $('.slideshow')    
    .after('<div id="nav">') 
    .cycle({
        fx: 'scrollLeft',
        /*next:   '.slideshow',*/ 
        timeout: 10000,
        pause: 1,
        speed: 1500,        
        pagerAnchorBuilder: function(index, el) {
          return '<div class="navItem"><a href="#">&nbsp;&nbsp;</a></div>';
        },
        pager: '#nav'
    });
});
