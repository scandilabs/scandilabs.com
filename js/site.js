/*
Does not account for img size
$(document).ready(function() { 
    
    resizeToMinHeight();
});
*/

$(window).load(function() {
    resizeToMinHeight();
});

/*
 * Doesn't work anyway, need to remember original body height..
 * jQuery.event.add(window, "resize", resizeToMinHeight);
 */

function resizeToMinHeight() 
{
    var h = $(window).height();
    var w = $(window).width();
    
    var docH = $('body').height();
    
    var footerHeight = 53;
    
    console.log('w ' + h + ', d ' + docH);
    if (h > docH) {
        console.log('adding footer margin');
        $("#footerMargin").css('height',(h-docH));
    } else {
        console.log('no footer margin');
    }
    
}