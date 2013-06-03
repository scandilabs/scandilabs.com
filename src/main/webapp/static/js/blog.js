$().ready(function() {
	
	/* Scroll to posts with the navigation on left */
    $('.postLink').on('click', function (e) {
        e.preventDefault();
        var anchor = $(this);
        var href=anchor.attr('href');
        var postId = href.split("=")[1];
        
        $('html,body').animate({
            scrollTop: ($("#post-"+postId).offset().top - 16) // 16 is a margin above
        },
        'slow');
        
    });
	
});
	
