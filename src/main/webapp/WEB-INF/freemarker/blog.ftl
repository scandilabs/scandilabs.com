<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<#include "includes/head.ftl" />
	<title>ScandiLabs : Blog</title>
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
		</ul><div class="mainCol">
			
		    <#if message??>
		        <#if messageSuccess>
		            <p class="successMessage">${message}</p>
		        <#else>
		            <p class="failureMessage">${message}</p>
		        </#if>
		    </#if>
		    
		    <#list postIds as postId>
		      <#assign post = postsById[postId] />
		      <h2 id="post-${postId}" class="blackLink noTopMargin"><a href="blog/${post.wp_slug}">${post.title}</a></h2>
		      <p class="postBody">${paragraphedDescriptions[postId]}</p>
		      <p style="font-style:italic; margin-bottom: 32px;">Posted on <a href="blog/${post.wp_slug}">${post.dateCreated?string("MMMM dd, yyyy")} at ${post.dateCreated?string("h:mm a")}</a></p>
			</#list>
				
		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "includes/bottom.ftl" />
</body>
</html>
