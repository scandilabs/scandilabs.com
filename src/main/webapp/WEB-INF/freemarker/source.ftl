<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<#include "includes/head.ftl" />
	<title>ScandiLabs : Java : Source</title>	
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


			<h1 class="noTopMargin">Catamaran Web Framework</h1>
			<h3>Browse Source Code</h3>
			<div class="github-widget" data-repo="scandilabs/catamaran"></div>

            <h3>View Documentation</h3>
            <p>Hosted <a href="http://scandilabs.github.io/catamaran/apidocs/">Javadoc documentation</a> is automatically updated with every new release.</p>
			
            <h1>Sample Applications</h1>
            <p>These web applications were all built using the Catamaran Web Framework:</p>
            <table>
            <tr>
                <td><a href="https://github.com/scandilabs/hello-world">hello-world</a></td>
                <td>The basic starter application used in our tutorial</td>
            </tr>
            <tr>
                <td><a href="https://github.com/scandilabs/scandilabs-apps/tree/master/java-scandilabs-com">java.scandilabs.com</a></td>
                <td>This website, including our solr-based knowledge base</td>
            </tr>
            <tr>
                <td style="padding-right:1em"><a href="https://github.com/scandilabs/scandilabs-apps/tree/master/connect-scandilabs-com">connect.scandilabs.com</a></td>
                <td>A contacts manager and CRM tool for Mobile</td>
            </tr>
            </table>
            
            <br/>            
            <p>New to Git?  See <a href="/faqs?query=git">keyword 'git'</a> and <a href="/faqs?query=github">keyword 'github'</a> in our knowledge base.
            

		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "includes/bottom.ftl" />
</body>
</html>