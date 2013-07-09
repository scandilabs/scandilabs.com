$().ready(function() {
	
    $("li.faq a.toggle").click(function(e) {
    	
    	e.preventDefault();
    	
    	var anchor = $(e.target);
    	var parent = anchor.parent('.faq');
    	var plus = parent.children('.plus');
    	var nodeId = parent.attr('id');
    	var idDelim = nodeId.indexOf("-");
    	var faqShortId = nodeId.substring(idDelim+1);
    	var nodeName = nodeId.substring(0, idDelim);
    	console.log("nodeId " + nodeId);
    	console.log("faqShortId " + faqShortId);
    	console.log("nodeName " + nodeName);
    	var answerParagraphSelector = "#" + nodeId + " div";
    	
    	// Detect if answer is currently shown or not
    	var ht = $(answerParagraphSelector).html();
    	var answerVisible = false;
     	if (ht == null || ht.length == 0) {
     		answerVisible = false;
     		console.log("a " + ht);
    	} else {
    		answerVisible = true;
    		console.log("b");
    	}    	
    	
    	//alert('ho=' + faqId);
     	if (answerVisible) {
     		$(answerParagraphSelector).html(null);
     		$(answerParagraphSelector).hide();
     		plus.html('+');
     	} else {	
	    	$.getJSON('/technology/knowledge/faq.json?key=' + faqShortId, function(data) {
	    		$(answerParagraphSelector).html('<p>' + data.answerAsMarkdown + '</p>');
	    	});
	    	$(answerParagraphSelector).show();
	    	plus.html('-');
     	}
	});
	
	
    // Render tag cloud html
    var output = "<ul>";
    
    var keyword = getQueryString()["query"];
    
    $.getJSON('/technology/knowledge/keywords.json?&canvas=small', function(data) {
        
        for (var i = 0, ii = data.length, thisTag, groupId; i < ii; i++) {
            element = data[i];            
            output +=  '<li><a class="tag-cloud-link" href="' + element.word + '" data-weight="65" style="font-size: ' + element.size + 'ex">' + element.word.toUpperCase() + '</a></li>';
        }
        output +=  "</ul>";
        document.getElementById("tags").innerHTML = output; 
    });

    // Display tag cloud canvas 
    /* reference: http://www.goat1000.com/tagcanvas.php */
    setTimeout(function (){
        if(!$('#myCanvas').tagcanvas({
          textFont: 'Helvetica,sans-serif',
          textColour: '#000000',
          outlineColour: '#777777',
          outlineThickness : 1,
          reverse: true,
          depth: 0.8,
          maxSpeed: 0.02,
          minSpeed: 0.01,
          weight: true,
          shape: "hcylinder",
          wheelZoom: false,
          freezeActive: true,
          initial: [0.8,-0.3],
          radiusX: 1.6,
          textHeight: 25,
          hideTags: true,
        },'tags')) {
          // something went wrong, hide the canvas container
            $('#myCanvas').add('#tags').hide();
        }
    },400);
    
    // Handle clicks on tags cloud items
    $(".tag-cloud-link").live('click', function(e) {
        e.preventDefault();
        var anchor = $(this);
        var keyword=anchor.attr('href');
        
        window.location.href = "/technology/knowledge?query=" + keyword;
        
    });    	
	
});
	
