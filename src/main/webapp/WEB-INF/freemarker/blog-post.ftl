<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>
	<#include "includes/head.ftl" />
    <title>ScandiLabs : ${post.title}</title>
	<link type="text/css" rel="stylesheet" href="static/css/faqs.css" media="screen, projection">
	
	<script type="text/javascript" src="static/js/jquery.animate.js"></script>
	<script type="text/javascript" src="static/js/jquery.tagcanvas.min.js"></script>
	<script type="text/javascript" src="static/js/faqs.js"></script>	
</head>
<body>
    <#assign page="blog" /> 
	<#include "includes/top-nav.ftl" />
	
	<div id="content">
	
	   <div class="clearfix"></div>		

		<ul class="leftNav">
		  <div style="padding-right: 26px;">
		      <li><a href="blog">Back</a></li>
		  </div>	
		</ul><div id="mainCol">
			
		    <#if message??>
		        <#if messageSuccess>
		            <p class="successMessage">${message}</p>
		        <#else>
		            <p class="failureMessage">${message}</p>
		        </#if>
		    </#if>
		    
		      <h2 class="noTopMargin">${post.title}</h2>
              <p >${post.description}</p>
              <p style="font-style:italic; margin-bottom: 32px;">Posted on ${post.dateCreated?string("MMM, dd yyyy")} at ${post.dateCreated?string("h:mm a")}</p>
				
		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "includes/bottom.ftl" />
</body>
</html>
