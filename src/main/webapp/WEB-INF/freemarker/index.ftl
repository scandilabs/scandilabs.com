<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<#include "includes/head.ftl" />
    
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

	
	        <h1 class="noTopMargin">Rapid Web Development with Java</h1>
	        <p>Inspired by Ruby on Rails and Django/Python, it gets your app up and running fast while retaining the full power and flexibility of enterprise Java tools.</p>
	        <p>Get started with our <a href="tutorial">tutorial</a> and create your first app in 30 minutes or less.</p> 
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