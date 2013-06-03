<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<#include "includes/head.ftl" />
	<title>ScandiLabs : Java : Overview</title>    
    <script type="text/javascript" src="static/js/jquery-1.4.js"></script>
	<script type="text/javascript" src="static/js/jquery.animate.js"></script>
	<script type="text/javascript" src="static/js/jquery.tagcanvas.min.js"></script>
    <script type="text/javascript" src="static/js/index.js"></script>
</head>
<body>
	<#include "includes/top-nav.ftl" />
	
	<div id="content">
		<ul class="leftNav">
			<#assign menu="overview" />
			<#include "includes/left-nav-content.ftl" />
		</ul><div id="mainCol">

	
	        <h1 class="noTopMargin">Speed, Quality, and Scale</h1>
	        <p>We at ScandiLabs take developer productivity very seriously.</p>
	        <p>Our clients need us to work quickly, but they don't want any <a target="_blank" href="http://en.wikipedia.org/wiki/Spaghetti_code">spaghetti code</a>.  And they can't afford to be tied down by technology frameworks that don't scale.</p>
	        <p>Therefore, we invest a lot of time and energy in our development infrastructure.  For example, our web development <a href="tutorial">tutorial</a> and <a href="source">tools</a> ensure a consistent coding style and facilitates team member load balancing and on-boarding.</p>  
	        <p>And our constantly-evolving <a href="faqs">Knowledge Base</a> ensures we never have to solve the same engineering problem twice.  Think of it as a combination of a wiki and Stack Overflow backed by a powerful search engine -- click the tag cloud below for a test drive.</p>
	        
		</div> <!-- mainCol -->
		
		
	    <div id="tag-cloud">
		    <div id="myCanvasContainer" >
	            <canvas width="960" height="500" id="myCanvas">
	            </canvas>
	        </div>
	        <div id="tags">
	        </div>    			
	    </div>		
		
	</div> <!-- content -->           
	<#include "includes/bottom.ftl" />
</body>
</html>