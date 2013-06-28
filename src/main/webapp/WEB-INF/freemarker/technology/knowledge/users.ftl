<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<#include "includes/head.ftl" />
</head>
<body>
	<#include "includes/top-nav.ftl" />
	
	<div id="content">
		<ul class="leftNav">
			<#assign menu="faqs" />
			<#include "includes/left-nav-content.ftl" />
		</ul><div class="mainCol">

			<h1>Users</h1>
			
			<a href="user-edit">Create User</a>
			<ul>
			<#list users as user>
				<li><a href="user?key=${user.key}">${user.name.last}, ${user.name.first}</a></li>
			</#list>
			</ul>
	
		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "includes/bottom.ftl" />	
</body>
</html>