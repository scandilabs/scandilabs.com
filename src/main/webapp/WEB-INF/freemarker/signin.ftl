<#import "/spring.ftl" as spring />
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
			<#include "technology/left-nav-content-include.ftl" />
		</ul><div class="mainCol">

			<form action="signin" method="post">
			
				<#if message??>
					<#if messageSuccess>
						<p class="successMessage">${message}</p>
					<#else>
						<p class="failureMessage">${message}</p>
					</#if>
				</#if>
			
				<div>			
			        <label for="email">Email</label>
			        <input type="text" name="email" />
				</div>
				<div>
			        <label for="password">Password</label>
			        <input type="password" name="password" />
				</div>
				<div>
					<label for="button"></label>
					<input type="submit" value="Sign in" />
					<a href="index">Cancel</a>
				</div>
				
			</form>
	
		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "includes/bottom.ftl" />
</body>
</html>