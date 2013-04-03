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
			<#assign menu="download" />
			<#include "includes/left-nav-content.ftl" />
		</ul><div id="mainCol">


			<h1 class="noTopMargin">Download</h1>
			<p>Compiled jar-files are available and ready to use from our <a href="http://maven.catamarancode.org/repository" target="_blank">Maven Repository</a>.</p>
    
            <p>To use this repository in your build, add this to your settings.xml (<a href="http://maven.apache.org/ref/3.0.3/maven-settings/settings.html">reference</a>):
            <pre><code>&lt;repository&gt;
    &lt;id&gt;catamaran&lt;/id&gt;
    &lt;url&gt;http://maven.catamarancode.org/repository&lt;/url&gt;
    &lt;releases&gt;
        &lt;enabled&gt;true&lt;/enabled&gt;
    &lt;/releases&gt;
    &lt;snapshots&gt;
        &lt;enabled&gt;true&lt;/enabled&gt;
    &lt;/snapshots&gt;
&lt;/repository&gt;       
            </code></pre>
            </p>

            <p>For more info, see <a href="/faqs?query=maven">keyword 'maven'</a> in our knowledge base.

		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "includes/bottom.ftl" />
</body>
</html>