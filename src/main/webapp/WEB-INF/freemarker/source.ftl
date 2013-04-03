<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<#include "includes/head.ftl" />
	<script type="text/javascript" src="static/js/jquery-1.4.js"></script>
    <script type="text/javascript" src="static/js/jquery.githubRepoWidget.js"></script>	
</head>
<body>
	<#include "includes/top-nav.ftl" />
	
	<div id="content">
		<ul class="leftNav">
			<#assign menu="source" />
			<#include "includes/left-nav-content.ftl" />
		</ul><div id="mainCol">


			<h1 class="noTopMargin">Source</h1>
			<h3>Web Framework</h3>			
			<div class="github-widget" data-repo="scandilabs/scandilabs-framework"></div>
			
            <h3>Sample Applications</h3>           
            <div class="github-widget" data-repo="scandilabs/scandilabs-apps"></div>
            
            <p>For more information, see <a href="/faqs?query=git">keyword 'git'</a> and <a href="/faqs?query=github">keyword 'github'</a> in our knowledge base.
            

		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "includes/bottom.ftl" />
</body>
</html>