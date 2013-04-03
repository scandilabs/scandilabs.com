<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<#include "includes/head.ftl" />

	<link type="text/css" rel="stylesheet" href="static/css/faqs.css" media="screen, projection">
	
    <script type="text/javascript" src="static/js/jquery-1.4.js"></script>
	<script type="text/javascript" src="static/js/jquery.animate.js"></script>
	<script type="text/javascript" src="static/js/jquery.tagcanvas.min.js"></script>
	<script type="text/javascript" src="static/js/global.js"></script>	
	<script type="text/javascript" src="static/js/faqs.js"></script>	
</head>
<body>
	<#include "includes/top-nav.ftl" />
	
	<div id="content">
	
		<div class="right" style="margin-top: -22px; float:right;">
		   <#if user??>
		      <a href="faq-edit">New</a> | 
		      <#if user.administrator><a href="users">Users</a> | </#if>
		      <a href="signout">Sign out ${user.email}</a>
	       <#else>
	          <a href="signin">Sign in</a>
	       </#if>
		   
		   <!-- TODO: Enable menu 
		   <#if user??> | <a href="faq-edit">Create</a><#if user.administrator> | <a href="users">Manage Users</a> | <a href="audits">History</a></#if></#if>
		   -->
	   </div>
	   <div class="clearfix"></div>		

		<ul class="leftNav">
			<#assign menu="faqs" />
			<#include "includes/left-nav-content.ftl" />

            <!--
			<div style="margin-top:24px;">			
				<h3>Related topics</h3>
				<ul>
				<#list keywords as keyword>
					<li><a href="faqs?query=${keyword}">${keyword}</a></li>
				</#list>
				</ul>
			</div>
			-->
			
		    <div style="margin-top:54px;" id="tag-cloud">
			    <div id="smallCanvasContainer" >
		            <canvas width="240" height="120" id="myCanvas">
		            </canvas>
		        </div>
		        <div id="tags">
	        	</div>    			
	    	</div>	
			
		</ul><div id="mainCol">
			
		    <#if message??>
		        <#if messageSuccess>
		            <p class="successMessage">${message}</p>
		        <#else>
		            <p class="failureMessage">${message}</p>
		        </#if>
		    </#if>
			
            <form method="GET" action="faqs">
                <input type="text" name="query" value="${RequestParameters.query!}" size="60"/>
                <input type="submit" value="Search" />
            </form>
            <form method="GET" action="faqs">
                <input type="hidden" name="query" value="" />
                <input type="submit" value="Clear" />
            </form>
			
			<ul id="level1">
			<#if (top.childNodes?size == 0)>
			    <li>
			         No results found for search '${RequestParameters.query!}'
			    </li>
			</#if>			
			<#list top.childNodes as level1Node>
				<li class="category">
				    <#if (level1Node.faqCount > 0)>
				        <a href="faqs?query=topic:${level1Node.colonSeparatedNameNoSpaces}">${level1Node.name}</a>
				    </#if>
					<ul>
					<#list level1Node.faqs as faq>
						<li id="${level1Node.nodeId}-${faq.shortId}" class="faq">
							<a class="toggle plus" name="${faq.shortId}" nohref>+</a> <a class="toggle" nohref>${faq.question}</a> <a href="faq?key=${faq.key}">[details]</a>
							<div class="answerBox"></div>
						</li>
					</#list>
					<#list level1Node.childNodes as level2Node>
						<li class="category">
						    <#if (level2Node.faqCount > 0)>
						      <a href="faqs?query=topic:${level1Node.colonSeparatedNameNoSpaces}">${level1Node.name}</a> : <a href="faqs?query=topic:${level2Node.colonSeparatedNameNoSpaces}">${level2Node.name}</a>
						    </#if>
							<ul>
							<#list level2Node.faqs as faq>
								<li id="${level2Node.nodeId}-${faq.shortId}" class="faq">
									<a class="toggle plus" name="${faq.shortId}" nohref>+</a> <a class="toggle" nohref>${faq.question}</a> <a href="faq?key=${faq.key}">[details]</a>
									<div class="answerBox"></div>
								</li>								
							</#list>
							<#list level2Node.childNodes as level3Node>
								<li class="category">
								    <#if (level3Node.faqCount > 0)>
								        <a href="faqs?query=topic:${level1Node.colonSeparatedNameNoSpaces}">${level1Node.name}</a> : <a href="faqs?query=topic:${level2Node.colonSeparatedNameNoSpaces}">${level2Node.name}</a> : <a href="faqs?query=topic:${level3Node.colonSeparatedNameNoSpaces}">${level3Node.name}</a><!-- (${level3Node.faqCount?c}) -->
								    </#if>
									<ul>
									<#list level3Node.faqs as faq>
										<li id="${level3Node.nodeId}-${faq.shortId}" class="faq">
											<a class="toggle plus" name="${faq.shortId}" nohref>+</a> <a class="toggle" nohref>${faq.question}</a> <a href="faq?key=${faq.key}">[details]</a>
											<div class="answerBox"></div>
										</li>
									</#list>						
									<#list level3Node.childNodes as level4Node>
										<li class="category">
										    <#if (level4Node.faqCount > 0)>
										      <a href="faqs?query=topic:${level1Node.colonSeparatedNameNoSpaces}">${level1Node.name} : <a href="faqs?query=topic:${level2Node.colonSeparatedNameNoSpaces}">${level2Node.name}</a> : <a href="faqs?query=topic:${level3Node.colonSeparatedNameNoSpaces}">${level3Node.name}</a> : <a href="faqs?query=topic:${level4Node.colonSeparatedNameNoSpaces}">${level4Node.name}</a><!-- (${level4Node.faqCount?c}) -->
										    </#if>
											<ul>
											<#list level4Node.faqs as faq>
												<li id="${level4Node.nodeId}-${faq.shortId}" class="faq">
													<a class="toggle plus" name="${faq.shortId}" nohref>+</a> <a class="toggle" nohref>${faq.question}</a> <a href="faq?key=${faq.key}">[details]</a>
													<div class="answerBox"></div>
												</li>
											</#list>
											</ul>
										</li>									
									</#list>
									</ul>
								</li>
							</#list>
							</ul>
						</li>
					</#list>
					</ul>					
				</li>
			</#list>
			</ul>
				
		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "includes/bottom.ftl" />
</body>
</html>
