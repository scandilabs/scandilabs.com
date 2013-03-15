var suppressNextFocusEvent = false;
var lastFocusedTagId = null;

$().ready(function() {
	
	//
	// AUTOCOMPLETE events
	//
	
	/* See http://docs.jquery.com/UI/Autocomplete */
	/* And also http://stackoverflow.com/questions/9934018/what-are-the-response-and-request-arguments-in-jquery-ui-autocompletes-sou */
	$("input.tagX1").autocomplete({
        source: function(request, response) {   
            console.log("searching..");         
            $.getJSON("tags1.json?term=" + request.term, function(data) {
                response(data);
                console.log("done searching..");
                suppressNextFocusEvent = true;
            });            
        },  
        minLength: 0,
        select: function(request, response) {
            console.log("select event.. firing close..");
            $("input.topTag").autocomplete("close");
        },
        close: function(request, response) {
            console.log("close event.. unsuppressing next focus");
            suppressNextFocusEvent = false;
        }
    });
    
    $("input.tagX2").autocomplete({
        source: function(request, response) {   
            console.log("searching..");
            var tagX = lastFocusedTagId.substring(3,4);
            var tagY = lastFocusedTagId.substring(4,5);
            console.log("tagX=" + tagX);
            tagX1Id = "#tag" + tagX + "1";
            tagX2Id = "#tag" + tagX + "2";
            tagX3Id = "#tag" + tagX + "3";
            tagX1 = $(tagX1Id).val();
            tagX2 = $(tagX2Id).val();
            tagX3 = $(tagX3Id).val();
            $.getJSON("tags2.json?tagX1=" + tagX1 + "&term=" + request.term, function(data) {
                response(data);
                console.log("done searching..");
                suppressNextFocusEvent = true;
            });            
        },  
        minLength: 0,
        select: function(request, response) {
            console.log("select event.. firing close..");
            $("input.topTag").autocomplete("close");
        },
        close: function(request, response) {
            console.log("close event.. unsuppressing next focus");
            suppressNextFocusEvent = false;
        }
    });    
    
    $("input.tagX3").autocomplete({
        source: function(request, response) {   
            console.log("searching..");    
            var tagX = lastFocusedTagId.substring(3,4);
            var tagY = lastFocusedTagId.substring(4,5);
            console.log("tagX=" + tagX);
            tagX1Id = "#tag" + tagX + "1";
            tagX2Id = "#tag" + tagX + "2";
            tagX3Id = "#tag" + tagX + "3";
            tagX1 = $(tagX1Id).val();
            tagX2 = $(tagX2Id).val();
            tagX3 = $(tagX3Id).val();
            $.getJSON("tags3.json?tagX1=" + tagX1 + "&tagX2=" + tagX2 + "&term=" + request.term, function(data) {
                response(data);
                console.log("done searching..");
                suppressNextFocusEvent = true;
            });            
        },  
        minLength: 0,
        select: function(request, response) {
            console.log("select event.. firing close..");
            $("input.topTag").autocomplete("close");
        },
        close: function(request, response) {
            console.log("close event.. unsuppressing next focus");
            suppressNextFocusEvent = false;
        }
    });    
    
    $("input.tagX3").autocomplete({
        source: function(request, response) {   
            console.log("searching..");    
            var tagX = lastFocusedTagId.substring(3,4);
            var tagY = lastFocusedTagId.substring(4,5);
            console.log("tagX=" + tagX);
            tagX1Id = "#tag" + tagX + "1";
            tagX2Id = "#tag" + tagX + "2";
            tagX3Id = "#tag" + tagX + "3";
            tagX1 = $(tagX1Id).val();
            tagX2 = $(tagX2Id).val();
            tagX3 = $(tagX3Id).val();
            $.getJSON("tags4.json?tagX1=" + tagX1 + "&tagX2=" + tagX2 + "&tagX3=" + tagX3 + "&term=" + request.term, function(data) {
                response(data);
                console.log("done searching..");
                suppressNextFocusEvent = true;
            });            
        },  
        minLength: 0,
        select: function(request, response) {
            console.log("select event.. firing close..");
            $("input.topTag").autocomplete("close");
        },
        close: function(request, response) {
            console.log("close event.. unsuppressing next focus");
            suppressNextFocusEvent = false;
        }
    });    
    
    // 
    // FOCUS events
    //
    $("input.tag").focus(function() {
        console.log("focus.. this is: " + $(this).attr("id"));
        
        // Shifting focus from one open drop-down to another field?
        if (lastFocusedTagId === $(this).attr("id")) {
            console.log("focus.. still on same field: " + $(this).attr("id"));
        } else {
            console.log("focus.. switched fields.. not suppressing search.. " + $(this).attr("id"));
            suppressNextFocusEvent = false;
        }
         
        lastFocusedTagId = $(this).attr("id");
        if ($("#" + lastFocusedTagId).val()) {
            console.log("focus event.. found value.. not firing search..");
        } else if (suppressNextFocusEvent) {
            console.log("focus event.. suppressing.. not firing search..");
            suppressNextFocusEvent = false;
        } else {
            console.log("focus event.. field empty.. firing search..");
            $("#" + lastFocusedTagId).autocomplete("search");
        }
    });
    
});
	
