<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Scandi Labs - What</title>
        <link type="text/css" rel="stylesheet" href="css/site.css" media="screen, projection">
        <link type="text/css" rel="stylesheet" href="css/top.css" media="screen, projection">
        <link type="text/css" rel="stylesheet" href="css/tabs.css" media="screen, projection">
        <link type="text/css" rel="stylesheet" href="css/what.css" media="screen, projection">
                
        <script type="text/javascript" src="js/site.js"></script>
		<?php include("include/analytics.php"); ?>
		
	    <script type="text/javascript" src="js/jquery-1.4.js"></script>
    	<script type="text/javascript" src="js/jquery.animate.js"></script>
		<script type="text/javascript" src="js/jquery.tagcanvas.min.js"></script>
	    <script type="text/javascript" src="js/compounds.js" ></script>		
        <script type="text/javascript" src="js/what.js"></script>
    </head>
    <body>
    <?php include("include/top.php"); ?>  

	<h2>We are all about Java.</h2>
	<p>Our ScandilLabs Java Web Framework is inspired by Rails and Django.  It provides a tutorial, reference documentation, FAQs, Java tools and conventions, and community discussion.</p>
	<p>This allows developers to get up and running quickly like a startup while still retaining all the scalability of enterprise Java.</p>
    <p><a href="http://java.scandilabs.com/">Read more</a> at java.scandilabs.com or click on an FAQ topic below:</p>
	        
    <div id="tag-cloud">
	    <div id="myCanvasContainer" >
            <canvas width="920" height="500" id="myCanvas">
            </canvas>
        </div>
        <div id="tags">
        </div>    			
    </div>
    
	<?php include("include/bottom.php"); ?>  
    </body>
</html>
