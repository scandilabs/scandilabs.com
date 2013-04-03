<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>ScandiLabs : Clients : MedVentive</title>
        <base href="/">        
        <!--[if IE]><script type="text/javascript">
            // Fix for IE ignoring relative base tags.
            // See http://stackoverflow.com/questions/3926197/html-base-tag-and-local-folder-path-with-internet-explorer
            (function() {
                var baseTag = document.getElementsByTagName('base')[0];
                baseTag.href = baseTag.href;
            })();
        </script><![endif]-->        
        <link type="text/css" rel="stylesheet" href="css/site.css" media="screen, projection">
        <link type="text/css" rel="stylesheet" href="css/top.css" media="screen, projection">
        <link type="text/css" rel="stylesheet" href="css/clients.css" media="screen, projection">
        <!--[if IE]>
            <link rel="stylesheet" type="text/css" href="css/ie.css" />
        <![endif]-->                

		<?php include("../include/analytics.php"); ?>
    </head>
    <body>
        
    	<div id="outerContent">
	        <?php include("../include/top.php"); ?>  
	        
	        <div id="content">
	            
	           <div class="mainColOuter">	               
    	           <div class="leftNavOuter">
        				<ul class="leftNav">
        					<li><a href="clients/index">Madaket Health</a></li>
        					<li><a href="clients/inspector-time">Inspector Time</a></li>
        					<li>MedVentive</li>
        					<li><a href="clients/postpost">PostPost</a></li>
        					<li><a href="clients/snagajob">SnagAJob</a></li>
        					<li><a href="clients/travelclick">TravelClick</a></li>					
        				</ul>
        				<img style="width:134px;" src="img/medventive_logo.gif" />
        				<p>A McKesson Company</p>
				    </div><div id="mainCol">
    					
                        <h2 class="noTopMargin">Advanced SaaS Application Monitoring</h2>
                        
                        <h4>The Problem</h4>
                        <p>
                            MedVentive, a pioneer in SaaS-based Healthcare IT services, needed an application monitoring solution.  They needed to ensure service uptime for a growing list of clients while allowing flexibility for client on-boarding and support.     
                        </p>
                        <h4>The ScandiLabs Solution</h4>
                        <p>
                              ScandiLabs proposed and implemented an advanced monitoring solution that emulated client usage patterns to detect any site anomolies.  The solution also kept track of internal deployment and on-boarding events to ensure that service was restored in a safe and timely fashion.  Solution highlights:
                        </p>                        
                        <ul>
                            <li>Pure Java, multi-threaded solution</li>
                            <li>Client list persistence/memory through MySQL database</li>
                            <li>Telephony-based event alerting</li>
                        </ul>
                        <p>
                            MedVentive is now looking at significantly increased uptime and service levels, which translates into happier customers.  
                        </p>                        
        
        				</div> <!-- mainCol -->
                </div>
	    	</div>  <!-- content -->
	    	
        <?php include("../include/bottom.php"); ?>  
    	</div> <!-- outerContent -->
    </body>
</html>
