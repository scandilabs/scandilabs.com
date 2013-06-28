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
	
			<h1>Activity</h1>
			
			<ul>
			<#list audits as audit>
				<li>${audit}</li>
			</#list>
			</ul>
	
		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "includes/bottom.ftl" />	
</body>
</html>