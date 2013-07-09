<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<#include "../../includes/head.ftl" />
</head>
<body>
	<#include "../../includes/top-nav.ftl" />
	
	<div id="content">
		<ul class="leftNav">
			<#assign menu="faqs" />
			<#include "../left-nav-content-include.ftl" />
		</ul><div class="mainCol">


			<h1 class="noTopMargin">${displayUser.name.first} ${displayUser.name.last}</h1>
		    <div>
                <label>Email:</label>
                ${displayUser.email}
            </div>
            <div>
                <label>Administrator?:</label>
                ${displayUser.administrator?string}
            </div>
            <div>
                <label>Context ID:</label>
                ${(displayUser.contextId)!}
            </div>
            <div>
                <label>Key:</label>
                ${(displayUser.key)!}
            </div>
            <div>
                <label>Short ID:</label>
                ${(displayUser.shortId)!}
            </div>
			
			<a href="user-edit?key=${displayUser.key}">Edit</a>
	
		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "../../includes/bottom.ftl" />	
</body>
</html>