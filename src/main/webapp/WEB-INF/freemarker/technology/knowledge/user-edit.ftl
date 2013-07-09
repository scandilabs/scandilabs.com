<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<#include "../../includes/head.ftl" />
</head>
<body>
	<#include "../../includes/top-nav.ftl" />
	
	<div id="content">
		<ul class="leftNav">
			<#assign menu="faqs" />
			<#include "../left-nav-content-include.ftl" />
		</ul><div class="mainCol">

		    <h1 class="noTopMargin">Edit User</h1>
		    <div>
		        <label>Context ID:</label>
		        ${(displayUser.contextId)!}
		    </div>
            <div>
                <label>Key:</label>
                ${(displayUser.key)!}
            </div>
            <div>
                <label>Short ID:</label>
                ${(displayUser.shortId)!}
            </div>
		    <form method="POST" action="user-edit">
		        <input type="hidden" name="key" value="${(displayUser.key)!}" />
		        <div>
		            <label>First: </label>
		            <input type="text" name="firstName" value="${(displayUser.name.first)!}" /><br/>
		        </div>		        
		        <div>
                    <label>Last:</label> 
                    <input type="text" name="lastName" value="${(displayUser.name.last)!}" /><br/>
                </div>
		        <div>
                    <label>Email:</label>
                    <input type="text" name="email" value="${(displayUser.email)!}" /><br/>
                </div>
		        <div>
                    <label>Password:</label>
                    <input type="password" name="password" value="${(displayUser.cleartextPassword)!}" /><br/>
                </div>
		        <div>
                    <label>Administrator?:</label>
                    <input type="text" name="administratorFlag" value="${(displayUser.administrator?string)!}" /><br/>
                </div>
		        
		        <div>
                    <label></label>
                    <input type="submit" value="Save" />
                </div>    
		    </form>	
	
		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "../../includes/bottom.ftl" />	
</body>
</html>