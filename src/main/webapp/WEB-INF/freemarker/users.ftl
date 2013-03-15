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