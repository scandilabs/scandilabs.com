<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <base href="/technology/catamaran/tutorial">        
	<#include "../../includes/head.ftl" />
	<title>ScandiLabs : Java : Tutorial</title>
    <link type="text/css" rel="stylesheet" href="/static/css/tutorial.css" media="screen, projection">
</head>
<body>
  <#assign page="technology" />
	<#include "../../includes/top-nav.ftl" />

	
	<div id="content">
		<ul class="leftNav">
			<#assign menu="tutorial" />
			<#include "../left-nav-content-include.ftl" />
		</ul><div class="mainCol">

			<div></div>
			${htmlContent}
			

		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "../../includes/bottom.ftl" />
</body>
</html>