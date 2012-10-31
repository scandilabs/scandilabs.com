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
					    Startups Are Fast					     
					</h2>
					<p>This is largely because they have no maintenance costs:</p>
                    <img src="assets/dev_vs_maint_cost.png" />
                    <p>But over time, startups accumulate maintenance costs (also called "design debt" or simply "spaghetti code"), often at an alarming rate.</p>
                    <h2>
                        What can be done?
                    </h2>
                    <p>
                        Maintenance costs are inevitable.  But they can grow rapidly like above, or slowly and flatten out over time:
                    </p>
                    <img src="assets/maint_cost_low.png" />
                    <p>
                        This is how maintenance costs on a Scandi Labs project evolve.  We accomplish this through:
                        <ul>
                            <li>Techology specialization and knowledge management: We solve technical problems only once</li>
                            <li>A flexible <a href="catamaran">development framework</a> that doesn't box us in in a way that causes problems down the road</li>
                            <li>Experience and volume: We have built a lot of web applications over the years, and we continue to do so</li>
                        </ul>
                    </p>

                    <h2>
                        Common Startup Problems                        
                    </h2>
                    <p>
                        TODO: Consider moving this and next h2 to the right sidebar.
                        - inability to scale team past founding engineer/cto, poor performance, wrong framework, framework doesn't scale, picking a framework that doesn't allow for performance tuning, last 10% problem
                    </p>


					<h2>
					    Common Enterprise Problems
					</h2>					
					<p>
					    slow implementations, poor usability, and
					    resistance to change expressed via sky-high change estimates.
					</p>
					<p>
					    But we believe the biggest reason is simply that enterprise software is inherently very complex. Technology executives make strategic decisions about
					    enterprise tools such as database, enterprise service bus (ESB), storage infrastructure, application servers, load balancers and monitoring infrastructure.
					    Developers need to wrap their heads around all of this, and then put it together in a unique way. Once this work is done, there is often resistance to
					    making further changes. And subsequent development efforts are usually shoe-horned into this assembled structure to avoid having to rock the boat. This
					    leads to fragmented and poorly engineered code, which in turn is fragile, error prone, and difficult to change.
					</p>
	        	</div>  <!-- mainCol -->
	        	
	        	<div id="mainRightCol">	
	        		<h1>Real world startup scaling examples</h1>
	        		<p>TODO: Consider moving this over to the Catamaran page:  One of the things that I've found throughout my career is the need to have long-lived processes. And Ruby, like many scripting languages, has trouble being an environment for long lived processes. But the JVM is very good at that, because it's been optimized for that over the last ten years.<br/><em>- <a href="http://www.artima.com/scalazine/articles/twitter_on_scala.html">Steve Jenson, Twitter</a></em></p>
					<p>PHP's popularity and simplicity made it easy for the company's developers to quickly build new features. But PHP's (lack of) performance makes scaling Facebook's site to handle hundreds of billions of page views a month problematic, so Facebook has made big investments in making it leaner and faster.<br/><em>- <a href="http://arstechnica.com/business/2011/12/facebook-looks-to-fix-php-performance-with-hiphop-virtual-machine/">Sean Gallagher, ars technica</a></em></p>
	        		
	        	</div>
	        	
	    	</div>  <!-- content -->
	    	
	    	<?php include("include/bottom.php"); ?>  
    	</div> <!-- outerContent -->
    	    	
    </body>
</html>
