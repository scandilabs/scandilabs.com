<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>
	<#include "includes/head.ftl" />
	
    <script type="text/javascript" src="static/js/jquery-1.4.js"></script>
    <script type="text/javascript" src="static/js/blog.js"></script>

	<link type="text/css" rel="stylesheet" href="static/css/blog.css" media="screen, projection">
</head>
<body>
    <#assign page="blog" />
	<#include "includes/top-nav.ftl" />
	
	<div id="content">
	
	   <div class="clearfix"></div>		

		<ul class="leftNav">
		  <div style="padding-right: 26px;">			
			<#list posts as post>
			     <#assign title=post.title>
			     <#if (title?length > 27)>
			         <#assign title=post.title?substring(0, 27) + "..">
			     </#if>			         
			     <li><a class="postLink" href="blog-post?id=${post.postid}">${title}</a></li>
            </#list> 
            <li style="text-align:right; padding-right:8px;"><a href="#">next 10</a></li>
            
		  </div>	
		</ul><div id="mainCol">
			
		    <#if message??>
		        <#if messageSuccess>
		            <p class="successMessage">${message}</p>
		        <#else>
		            <p class="failureMessage">${message}</p>
		        </#if>
		    </#if>
		    
		    <#list posts as post>
		      <h2 id="post-${post.postid}" class="blackLink noTopMargin"><a href="blog-post?id=${post.postid}">${post.title}</a></h2>
		      <p class="postBody">${post.description}</p>
		      <p style="font-style:italic; margin-bottom: 32px;">Posted on <a href="blog-post?id=${post.postid}">${post.dateCreated?string("MMM, dd yyyy")} at ${post.dateCreated?string("h:mm a")}</a></p>
			</#list>
				
		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "includes/bottom.ftl" />
</body>
</html>