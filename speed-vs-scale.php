<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>New Web Project</title>
        <link type="text/css" rel="stylesheet" href="css/site.css" media="screen, projection">
        <link type="text/css" rel="stylesheet" href="css/top.css" media="screen, projection">
        <link type="text/css" rel="stylesheet" href="css/tabs.css" media="screen, projection">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
        <script src="https://raw.github.com/ekallevig/jShowOff/master/jquery.jshowoff.min.js"></script>
    </head>
    <body>
    	<div id="outerContent">
        
	        <?php include("include/top.php"); ?>  
	        
	        <div id="content">     
	        	<?php include("include/why-tabs.php"); ?>
	        	 
	        	<div id="mainCol">
	        
					<h1>
					    Startup Speed, Enterprise Scaling
					</h1>
					<h2>
					    Why is enterprise software development slow?
					</h2>
					<img src="assets/dev_vs_maint_cost.png" />
					<p>
					    If you talk to business managers who rely on in-house developed software, you will often hear stories about slow implementations, poor usability, and
					    resistance to change expressed via sky-high change estimates.
					</p>
					<p>
					    There are a variety of reasons for this. Many of them are related to company structure and size.
					</p>
					<h2>
					    Complexity kills
					</h2>
					<p>
					    But we believe the biggest reason is simply that enterprise software is inherently very complex. Technology executives make strategic decisions about
					    enterprise tools such as database, enterprise service bus (ESB), storage infrastructure, application servers, load balancers and monitoring infrastructure.
					    Developers need to wrap their heads around all of this, and then put it together in a unique way. Once this work is done, there is often resistance to
					    making further changes. And subsequent development efforts are usually shoe-horned into this assembled structure to avoid having to rock the boat. This
					    leads to fragmented and poorly engineered code, which in turn is fragile, error prone, and difficult to change.
					</p>
					<h2>
					    Startups are faster
					</h2>
					<p>
					    Startups usually start out with fewer sub-systems and little to no existing IT infrastructure. In addition, they have learned to use pre-assembled
					    platforms and frameworks which provide most of what they need. Web development frameworks like Ruby on Rails and Django/Python supply pre-built solutions
					    to the most common problems, as well as easy-to-use tutorials that enable a developer to be productive and writing code in hours.
					</p>
					<h2>
					    But..
					</h2>
					<p>
					    The standard platforms and frameworks used by startups come with a cost. This cost can be divided in three broad areas: Performance, code maintenance, and
					    what we at Scandi Labs like to call "the last 10% problem".
					</p>
					<p>
					    <strong>Performance. </strong>
					    At Scandi Labs, we do most of our work in Java. The lot of Ruby, Python and PHP folks will argue that
					</p>        
	        	</div>  <!-- mainCol -->
	        	
	        	<div id="mainRightCol">	
	        		<h1>Real world startup scaling examples</h1>
	        		<p>One of the things that I've found throughout my career is the need to have long-lived processes. And Ruby, like many scripting languages, has trouble being an environment for long lived processes. But the JVM is very good at that, because it's been optimized for that over the last ten years.<br/><em>- <a href="http://www.artima.com/scalazine/articles/twitter_on_scala.html">Steve Jenson, Twitter</a></em></p>
					<p>PHP's popularity and simplicity made it easy for the company's developers to quickly build new features. But PHP's (lack of) performance makes scaling Facebook's site to handle hundreds of billions of page views a month problematic, so Facebook has made big investments in making it leaner and faster.<br/><em>- <a href="http://arstechnica.com/business/2011/12/facebook-looks-to-fix-php-performance-with-hiphop-virtual-machine/">Sean Gallagher, ars technica</a></em></p>
	        		
	        	</div>
	        	
	    	</div>  <!-- content -->
	    	
	    	<?php include("include/bottom.php"); ?>  
    	</div> <!-- outerContent -->
    	    	
    </body>
</html>
