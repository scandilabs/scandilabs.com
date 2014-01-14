<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <base href="/">        
        <#include "../includes/head.ftl" />    
        <title>ScandiLabs : Clients : PostPost</title>
        <link type="text/css" rel="stylesheet" href="static/css/clients.css" media="screen, projection">
    </head>
    <body>
        
    	<div id="outerContent">
          <#assign page="clients" />
        	<#include "../includes/top-nav.ftl" />
	        
	        <div id="content">     
	
	           <div class="mainColOuter">
                    <div class="leftNavOuter">
                    	<ul class="leftNav">
                    		<li><a href="clients">Madaket Health</a></li>
                    		<li><a href="clients/inspector-time">Inspector Time</a></li>
                    		<li><a href="clients/medventive">MedVentive</a></li>
                    		<li>PostPost</li>
                    		<li><a href="clients/snagajob">SnagAJob</a></li>
                    		<li><a href="clients/travelclick">TravelClick</a></li>
                    	</ul>    				
                    	<img style="" src="static/img/postpost-logo.png" />
                	</div><div class="mainCol">
                	
                		<h2 class="noTopMargin">Social Media Search Startup</h2>
                		
                		<h4>The Problem</h4>
                        <p>
                            PostPost grew out of a social media user's frustration with ineffective searches for old tweets and status updates within Twitter.  Finding tweets required lengthy scrolling of the timeline.  A better way required some serious search technology to make searching fast and scalable.              
                        </p>
                        <h4>The ScandiLabs Solution</h4>
                        <p>
                            ScandiLabs helped design, develop, and grow the service as a vendor to Boathouse Group, a Waltham-based agency that incubated the PostPost venture.  Solution highlights:
                        </p>                        
                        <ul>
                            <li>Terabyte-sized search index sharded across multiple Dell R515 servers with 64GBs of RAM and SSD flash drive technology</li>
                            <li>Innovative user experience technology including drag-and-drop features implemented with jQuery and HTML5 widgets</li>
                            <li>Separate data center build-out at Boathouse's offices with redundant internet service providers</li>
                            <li>High-capacity, distributed social media and web/html crawler technology across more than 10 servers and JVMs</li>
                        </ul>       
                        <p>
                            Thanks to ScandiLabs, PostPost maintains impressive uptime numbers while servicing thousands of users and adding several gigabytes of data every day.   
                        </p>         
                    	
                    </div> <!-- mainCol -->
                </div>
				
            	<div class="wideImgBox raised drop-shadow thinBorder">
                	<img src="static/img/pp.png" />
               	</div>

	    	</div>  <!-- content -->	        
	    	
        <#include "../includes/bottom.ftl" />
    	</div> <!-- outerContent -->
    </body>
</html>
