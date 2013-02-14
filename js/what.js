$(document).ready(function() { 
    
    // Render tag cloud html
    var output = "<ul>";
    
    $.getJSON('http://java.scandilabs.com/keywords.json', function(data) {
        
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
          textFont: 'Arial,Helvetica,sans-serif',
          //textFont: 'Arial,Helvetica,sans-serif',
          textColour: '#0C3550',
          outlineColour: '#66CCCC',
          outlineThickness : 1,
          reverse: true,
          depth: 0.8,
          maxSpeed: 0.02,
          minSpeed: 0.01,
          weight: true,
          shape: "hcylinder",
          wheelZoom: false,
          freezeActive: false,
          initial: [0.8,-0.3],
          radiusX: 1.6,
          textHeight: 25,
          hideTags: false,
        },'tags')) {
          // something went wrong, hide the canvas container
            $('#myCanvas').add('#tags').hide();
        }
    },100);
    
    // Handle clicks on tags cloud items
    $(".tag-cloud-link").live('click', function(e) {
        e.preventDefault();
        var anchor = $(this);
        var keyword=anchor.attr('href');
        
        window.location.href = "http://java.scandilabs.com/faqs?query=" + keyword;
        
    });     

});
