<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>
	<#include "includes/head.ftl" />
</head>
<body>
	<#include "includes/top-nav.ftl" />
	
	<div id="content">
		<ul class="leftNav">
			<#assign menu="faqs" />
			<#include "includes/left-nav-content.ftl" />
		</ul><div id="mainCol">


			<h1>${displayUser.name.first} ${displayUser.name.last}</h1>
			<p>
			   Email: ${displayUser.email}<br/>
			   Administrator?: ${displayUser.administrator?string}<br/>
			   Context ID: ${displayUser.contextId}<br/>
			   Key: ${displayUser.key}<br/>
			   Short ID: ${displayUser.shortId}<br/>
		   </p>
			
			<a href="user-edit?key=${displayUser.key}">Edit</a>
	
		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "includes/bottom.ftl" />	
</body>
</html>