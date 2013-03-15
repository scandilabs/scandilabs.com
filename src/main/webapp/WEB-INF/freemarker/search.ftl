<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>
	<#include "includes/head.ftl" />
</head>
<body>
	<#include "includes/top-nav.ftl" />
	
	<div id="bodyContent">

		<#if message??>
			<div class="errorMessage">
			<#if message.success>
				<p class="successMessage">${message.text}</p>
			<#else>
				<p class="failureMessage">${message.text}</p>
			</#if>
			</div>
		</#if>
	
		<p>
		<form method="GET" action="search">
			<input type="text" name="query" />
			<input type="submit" value="Search" />
		</form>
		</p>
	
		<#if faqs??>
		<h3>${faqs?size} result<#if (faqs?size > 1)>s</#if> for "${RequestParameters.query}"</h3>
		<ul>
		<#list faqs as faq>
			<li><a href="faq?key=${faq.key}">${faq.question}</a><p>${faq.answer}</p></li>
		</#list>
		</ul>
		</#if>			
		
	</div> <!-- bodyContent -->	
</body>
</html>