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

		    <h1>Edit User</h1>
		    Context ID: ${(displayUser.contextId)!}<br/>
		    Key: ${(displayUser.key)!}<br/>
		    Short ID: ${(displayUser.shortId)!}<br/>
		    <form method="POST" action="user-edit">
		        <input type="hidden" name="key" value="${(displayUser.key)!}" />
		        First: <input type="text" name="firstName" value="${(displayUser.name.first)!}" /><br/>
		        Last: <input type="text" name="lastName" value="${(displayUser.name.last)!}" /><br/>
		        Email: <input type="text" name="email" value="${(displayUser.email)!}" /><br/>
		        Password: <input type="password" name="password" value="${(displayUser.cleartextPassword)!}" /><br/>
		        Administrator?: <input type="text" name="administratorFlag" value="${(displayUser.administrator?string)!}" /><br/>
		        
		        <input type="submit" value="Save" />    
		    </form>	
	
		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "includes/bottom.ftl" />	
</body>
</html>