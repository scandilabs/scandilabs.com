$(document).ready(function() { 
    
    console.log('ready');
    
    var curIdx = 0;
    var maxIdx = 1; // Increment this as we add more slides
    var items = $('.rotatorItem');
    var icons = $('.rotatorNav li');
    
    items.hide();
    
    $('.rotatorNav li').click(function() {
        var clickedIdx = $(this).attr('data-idx');
        console.log('clicked ' + clickedIdx + ' cur ' + curIdx);
        show(curIdx, clickedIdx);
        curIdx = clickedIdx;
        //clearTimeout(timeoutId);
        //timeoutId = setTimeout(doAuto, 100000);
    });
    
    // hash?
    if (window.location.hash != null) {
        var hashIdx = window.location.hash.substr(1, 2);
        console.log('url ' + hashIdx);
        show(curIdx, hashIdx);
        curIdx = hashIdx;
        
    } else {
        items.first().show();
        icons.first().addClass("activeIcon");
    }
    
    // Clicks on image
    $('.imgBox').click(function() {
        next();
    });
    
    /*
    $('#clientBox .rotatorItem').hover(function() {
        timeoutId = setTimeout(doAuto, 100000);
    });
    */
   
    function isNumber(n) {
        return !isNaN(parseFloat(n)) && isFinite(n);
    }
    
    function next() {    
        
        // fix for NaN
        if (!(isNumber(curIdx))) {
            curIdx = 0;
        }
          
        console.log('next1 cur ' + curIdx + ' next ' + nextIdx);              
        var nextIdx = parseInt(curIdx, 10) + parseInt(1, 10);
        
        if (nextIdx >= items.length) nextIdx = 0;
        console.log('next2 cur ' + curIdx + ' next ' + nextIdx);
        show(curIdx, nextIdx);
        curIdx = nextIdx; 
    }
    
    function show(paramCurIdx, nextIdx) {
        console.log('show cur ' + paramCurIdx + ' next ' + nextIdx);
        items.eq(paramCurIdx).fadeOut();
        items.eq(nextIdx).fadeIn();
        window.location.hash = nextIdx;

        icons.eq(paramCurIdx).removeClass("activeIcon");                    
        icons.eq(nextIdx).addClass("activeIcon");
    }
    
    function doAuto() {
        console.log('auto cur ' + curIdx);
        next();
        timeoutId = setTimeout(doAuto, 100000);
    }
    
    //var timeoutId = setTimeout(doAuto, 100000); 
});
