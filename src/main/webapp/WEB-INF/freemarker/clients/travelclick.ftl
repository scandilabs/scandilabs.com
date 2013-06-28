<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <base href="/">        
        <#include "../includes/head.ftl" />    
        <title>ScandiLabs : Clients : TravelClick</title>
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
        					<li><a href="clients/index">Madaket Health</a></li>
        					<li><a href="clients/inspector-time">Inspector Time</a></li>
        					<li><a href="clients/medventive">MedVentive</a></li>
        					<li><a href="clients/postpost">PostPost</a></li>
        					<li><a href="clients/snagajob">SnagAJob</a></li>
        					<li>TravelClick</li>
        				</ul>
        				<img style="width:150px; " src="static/img/travelclick_logo.png" />
    				</div><div class="mainCol">
                        <h2 class="noTopMargin">Enterprise Client Reporting</h2>
                            
                        <h4>The Problem</h4>
                        <p>
                            As the leading hotel booking engine for hotel customers across the globe, TravelClick faced a complex set of SaaS performance challenges.                           
                        </p>
                        <h4>The ScandiLabs Solution</h4>
                        <p>
                            We were brought in to analyze and implement performance enhancements at multiple layers in the technology stack.  Project highlights:                                                                                                              
                        </p>
                        <ul>
                            <li>Improved caching of hotel-specific user interface data</li>
                            <li>Established detailed page and call-specific instrumentation for better performance analysis</li>
                            <li>Analyzed and re-structured Javascript and CSS for faster parallel loading</li>
                        </ul>


    				</div> <!-- mainCol -->	
				</div>
	    	</div>  <!-- content -->	        
	        	    	
        <#include "../includes/bottom.ftl" />
    	</div> <!-- outerContent -->
    </body>
</html>
