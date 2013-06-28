<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <base href="/">        
    <!--[if IE]><script type="text/javascript">
        // Fix for IE ignoring relative base tags.
        // See http://stackoverflow.com/questions/3926197/html-base-tag-and-local-folder-path-with-internet-explorer
        (function() {
            var baseTag = document.getElementsByTagName('base')[0];
            baseTag.href = baseTag.href;
        })();
    </script><![endif]-->        

	<#include "includes/head.ftl" />
    <title>ScandiLabs : Blog : ${post.title}</title>
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
		</ul><div class="mainCol">
			
		    <#if message??>
		        <#if messageSuccess>
		            <p class="successMessage">${message}</p>
		        <#else>
		            <p class="failureMessage">${message}</p>
		        </#if>
		    </#if>
		    
		      <h2 class="noTopMargin">${post.title}</h2>
              <p >${paragraphedDescription}</p>
              <p style="font-style:italic; margin-bottom: 32px;">Posted on ${post.dateCreated?string("MMM, dd yyyy")} at ${post.dateCreated?string("h:mm a")}</p>
				
		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "includes/bottom.ftl" />
</body>
</html>
