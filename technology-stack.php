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
					    Technology Stack
					</h1>
					<p>In order to <a href="speed-vs-scale">maximize speed</a>, we prefer to use a software development framework.  But to retain the flexibility of enterprise software to tweak performance, maintain software structure, and avoid the "last 10% problem", we have created <a href="http://catamaranframework.org">Catamaran Framework</a>, our own open-source development framework.</p>
					
					<p>
					    <a href="http://catamaranframework.org">Catamaran Framework</a> packages the following proven enterprise Java technologies into a lightweight set of best practices and tools inspired by scripting-language based frameworks such as Ruby on Rails and Python/Django:
					</p>
					<ul>
						<li>MySQL database with Hibernate and Java Persistence 2.0</li>
						<li>Apache Tomcat web and application server</li>
						<li>Spring Framework and Java EE 6</li>
						<li>Freemarker template engine for HTML rendering</li>
						<li>Apache Solr search engine</li>
					</ul>
					<p>As aresult, our clients enjoy the best of both worlds -- <a href="speed-vs-scale">startup speed and enterprise scalability</a>.
				</p>	
	        	</div>  <!-- mainCol -->
	        	
	        	<div id="mainRightCol">
	        		<h1>Catamaran Framework Features</h1>
	        		<ul>
	        			<li>100% <a href="https://github.com/catamaran/catamaran-framework">open source</a></li>
	        			<li>Solr client-side federation connections</li>
	        			<li>Consistent hashing resource pool</li>
	        			<li><a href="http://martinfowler.com/eaaCatalog/domainModel.html">Domain Driven Development</a> via <a href="https://github.com/catamaran/catamaran-framework/tree/master/catamaran-entity">catamaran-entity</a></li>
						<li>TODO: Push javadoc to github: https://help.github.com/articles/creating-project-pages-manually </li>
						<li>The great debate: "Dynamic languages are common because they are much easier to use than Java or .Net on the background, providing as much as 10x more developer productivity." -- <a href="http://www.cio.com/article/446829/PHP_JavaScript_Ruby_Perl_Python_and_Tcl_Today_The_State_of_the_Scripting_Universe?page=3&taxonomyId=3038">Jeff Hobbs</a></li>
	        		</ul>
	        	</div>
        	
	    	</div>  <!-- content -->
    	
    		<?php include("include/bottom.php"); ?>
    	
    	</div>  <!-- outerContent -->  
    </body>
</html>
