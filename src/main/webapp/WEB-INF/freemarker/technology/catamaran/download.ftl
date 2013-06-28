<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <base href="/">        
	<#include "../../includes/head.ftl" />
	<title>ScandiLabs : Java : Download</title>
</head>
<body>
  <#assign page="technology" />
	<#include "../../includes/top-nav.ftl" />
	
	<div id="content">
		<ul class="leftNav">
			<#assign menu="download" />
			<#include "../left-nav-content-include.ftl" />
		</ul><div class="mainCol">


			<h1 class="noTopMargin">How To Get Started</h1>
            <h3>Starter Web Application</h3>            
            <p>To start your own web project we recommend you grab our blank <a href="https://github.com/scandilabs/hello-world">hello-world</a> web application template:</p>
            <pre><code>git clone git@github.com:scandilabs/hello-world.git</code></pre>
            
            <p>New to Git?  See our <a href="tutorial">tutorial</a>.  Or search our knowledge base for <a href="/faqs?query=git">keyword 'git'</a> or <a href="/faqs?query=github">keyword 'github'</a>.
            
			<h3>Maven</h3>
			<p>The latest catamaran-x.x.x.jar file is available from our <a href="http://maven.scandilabs.com/repository" target="_blank">Maven Repository</a> under <a href="http://maven.scandilabs.com/repository" target="_blank">com.scandilabs.catamaran</a>.</p>
    
            <p>To use this repository in your build, add the following to your settings.xml file (<a href="http://maven.apache.org/ref/3.0.3/maven-settings/settings.html">what is this?</a>):
            <pre><code>&lt;repository&gt;
    &lt;id&gt;maven.scandilabs&lt;/id&gt;
    &lt;url&gt;http://maven.scandilabs.com/repository&lt;/url&gt;
    &lt;releases&gt;
        &lt;enabled&gt;true&lt;/enabled&gt;
    &lt;/releases&gt;
    &lt;snapshots&gt;
        &lt;enabled&gt;true&lt;/enabled&gt;
    &lt;/snapshots&gt;
&lt;/repository&gt;       
            </code></pre>
            </p>
            <p>New to maven?  See <a href="/faqs?query=maven">keyword 'maven'</a> in our knowledge base.</p>

		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "../../includes/bottom.ftl" />
</body>
</html>