<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<#include "includes/head.ftl" />

    <link type="text/css" rel="stylesheet" href="static/css/tutorial.css" media="screen, projection">
</head>
<body>
	<#include "includes/top-nav.ftl" />
	
	<div id="content">
		<ul class="leftNav">
			<#assign menu="tutorial" />
			<#include "includes/left-nav-content.ftl" />
		</ul><div id="mainCol">

			<div></div>
			${htmlContent}
			

		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "includes/bottom.ftl" />
</body>
</html>