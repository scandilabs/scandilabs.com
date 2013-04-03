<#import "spring.ftl" as spring />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">
<#assign page = "notFound">
<head>
	<#include "includes/head.ftl" />
</head>
<#flush>
<body>
	<#include "includes/top-nav.ftl" />
	
	<h1>Sorry, but there has been some sort of error.</h1>				
	<#if logExceptionMessage??>
		<p>${logExceptionMessage}</p>
	</#if>			
	<p>If you receive this error message a second time, please <a href="mailto:support@scandilabs.com?subject=ScandiLabs Java error, code: ${logExceptionID}">email us</a>.</p>
		
	<#include "includes/bottom.ftl" />
</body>
</html>