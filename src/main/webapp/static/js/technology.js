$(document).ready(function() { 
    
    // Render tag cloud html
    var output = "<ul>";
    
    $.getJSON('/technology/knowledge/keywords.json', function(data) {
        
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
           // $('#myCanvas').add('#tags').hide();
        }
    },400);
    
    // Handle clicks on tags cloud items
    $(".tag-cloud-link").live('click', function(e) {
        e.preventDefault();
        var anchor = $(this);
        var keyword=anchor.attr('href');
        
        window.location.href = "faqs?query=" + keyword;
        
    });     

});