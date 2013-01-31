

$(document).ready(function() {
    $('.slideshow').cycle({
        fx: 'scrollLeft',
        next:   '.slideshow', 
        timeout:  4000,
        speed: 500  
    });
});
