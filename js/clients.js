$(document).ready(function() { 
    
    console.log('ready');
    
    var curIdx = 0;
    var items = $('.rotatorItem');
    var icons = $('.rotatorNav li');
    
    items.hide();
    items.first().show();
    icons.first().addClass("activeIcon");
    
    $('.rotatorNav li').click(function() {
        var clickedIdx = $(this).attr('data-idx');
        console.log('clicked ' + clickedIdx + ' cur ' + curIdx);
        show(curIdx, clickedIdx);
        curIdx = clickedIdx;
        clearTimeout(timeoutId);
        timeoutId = setTimeout(doAuto, 100000);
    });
    
    $('#clientBox .rotatorItem').hover(function() {
        timeoutId = setTimeout(doAuto, 100000);
    });
    
    function next() {      
        //console.log('next1 cur ' + curIdx + ' next ' + nextIdx);              
        var nextIdx = parseInt(curIdx, 10) + parseInt(1, 10);
        if (nextIdx >= items.length) nextIdx = 0;
        //console.log('next2 cur ' + curIdx + ' next ' + nextIdx);
        show(curIdx, nextIdx);
        curIdx = nextIdx; 
    }
    
    function show(paramCurIdx, nextIdx) {
        console.log('show cur ' + paramCurIdx + ' next ' + nextIdx);
        items.eq(paramCurIdx).fadeOut();
        items.eq(nextIdx).fadeIn();

        icons.eq(paramCurIdx).removeClass("activeIcon");                    
        icons.eq(nextIdx).addClass("activeIcon");
    }
    
    function doAuto() {
        console.log('auto cur ' + curIdx);
        next();
        timeoutId = setTimeout(doAuto, 100000);
    }
    var timeoutId = setTimeout(doAuto, 100000); 
});
