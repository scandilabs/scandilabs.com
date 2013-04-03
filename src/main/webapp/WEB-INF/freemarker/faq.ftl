<#import "/spring.ftl" as spring />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<#include "includes/head.ftl" />
    
	<link type="text/css" rel="stylesheet" href="static/css/faqs.css" media="screen, projection">
</head>
<body>
	<#include "includes/top-nav.ftl" />

	<div id="content">
		<ul class="leftNav">
			<#assign menu="faqs" />
			<div style="height: 100px">
    			<li><a href="faqs">Back</a></li>
    		    <#if user??>
    		        <li><a href="faq-edit?key=${faq.key}">Edit</a></li>
    		        <#if ((user.administrator) && !(faq.visibility == "PUBLIC"))>
    		            <li><a href="faq-publicize?key=${faq.key}">Publicize</a></li>
    		        </#if>
    		    </#if>
		    </div>
		    
            <div style="margin-top:24px;">          
                <h3>Related topics</h3>
                <ul>
                <#list keywords as keyword>
                    <li><a href="faqs?query=${keyword}">${keyword}</a></li>
                </#list>
                </ul>
            </div>
		    
			
		</ul><div id="mainCol">


		    <#if message??>
		        <#if messageSuccess>
		            <p class="successMessage">${message}</p>
		        <#else>
		            <p class="failureMessage">${message}</p>
		        </#if>
		    </#if>
			
			<h2 class="noTopMargin">${faq.question}</h2>
			<div class="singleFaq">		
		        <div class="answerBox"><p>${faq.answerAsMarkdown}<p></div>
		    </div>
		    <div class="faqMeta">
		        Owner: ${faq.ownerName!} | 
		        Tagged as: <ul class="tags" style="list-style:none">               
		            <#list faq.nestedTagsAsList as tag><li style="">
		                <a href="faqs?query=topic:${tag.colonSeparatedNoSpaces}">${tag.colonSeparated}</a>
		            </#list>
		        </ul>
		    </div>           
		    
		    <#if (comments?size > 0)>
		        <hr/>
		        <h4>Comments:</h4>
		        <#list comments as comment>
		            ${comment.ownerName} on ${comment.lastModifiedTime?datetime?string} said:<br/>
		            ${comment.body}<br/><br/>
		        </#list>
		    </#if>
		    <#if user??>
		        <hr/>
		        <h4>New comment:</h4>
		        <form method="post" action="comment-edit">
		            <input type="hidden" name="faqKey" value="${(faq.key)!}" />
		            <input type="hidden" name="commentKey" value="${(currentComment.key)!}" />
		            <textarea rows="4" cols="72" name="body">${(currentComment.body)!}</textarea>
		            <input type="submit" tabindex=99 value="Save" />
		        </form>
		    </#if>
		    
		    <#if user??>
		        <hr/>
		        <h4>Activity:</h4>
		        <#list audits as audit>
		            ${audit.ownerName} on ${audit.lastModifiedTime?datetime?string}: ${audit.body}<br/><br/>
		        </#list>
		    </#if>

		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "includes/bottom.ftl" />
</body>
</html>