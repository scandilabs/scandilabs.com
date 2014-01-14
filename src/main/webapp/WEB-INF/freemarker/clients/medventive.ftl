<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <base href="/">        
        <#include "../includes/head.ftl" />    
        <title>ScandiLabs : Clients : MedVentive</title>
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
        					<li>MedVentive</li>
        					<li><a href="clients/postpost">PostPost</a></li>
        					<li><a href="clients/snagajob">SnagAJob</a></li>
        					<li><a href="clients/travelclick">TravelClick</a></li>					
        				</ul>
        				<img style="width:134px;" src="static/img/medventive_logo.gif" />
        				<p>A McKesson Company</p>
				    </div><div class="mainCol">
    					
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
	    	
        <#include "../includes/bottom.ftl" />
    	</div> <!-- outerContent -->
    </body>
</html>
