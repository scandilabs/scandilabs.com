<#import "/spring.ftl" as spring />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<#include "../../includes/head.ftl" />
	<title>ScandiLabs : Java : Knowledge Base : ${faq.question}</title>	    
	<link type="text/css" rel="stylesheet" href="/static/css/faqs.css" media="screen, projection">
</head>
<body>
	<#include "../../includes/top-nav.ftl" />

	<div id="content">
		<ul class="leftNav">
			<div style="height: 100px">
    			<li><a href="../knowledge">Back to Search</a></li>
    		    <#if (user??) && ( (user.administrator) || (faq.ownerKey == user.key) )>
    		        <li><a href="entry-edit?key=${faq.key}">Edit</a></li>
    		        <li><a href="entry-delete?key=${faq.key}">Delete</a></li>
    		    </#if>
                <#if ((user??) && (user.administrator) && !(faq.visibility == "PUBLIC"))>
                    <li><a href="entry-publicize?key=${faq.key}">Publicize</a></li>
                </#if>
		    </div>
		    
            <div style="margin-top:24px;">          
                <h3>Related topics</h3>
                <ul>
                <#list keywords as keyword>
                    <li><a href="../knowledge?query=${keyword}">${keyword}</a></li>
                </#list>
                </ul>
            </div>
		    
			
		</ul><div class="mainCol">


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
		        Tags: <ul class="tags" style="list-style:none">               
		            <#list faq.nestedTagsAsList as tag><li style="">
		                <a href="../knowledge?query=topic:${tag.colonSeparatedNoSpaces}">${tag.colonSeparated}</a>
		            </#list>
		        </ul>
		        <br/>Posted by ${faq.ownerName!} on ${faq.lastModifiedTime?datetime?string}
		        
		    </div>           
		    
		    <#if (comments?size > 0)>
		        <#list comments as comment>
                    <hr/>
                    Comment from ${comment.ownerName} on ${comment.lastModifiedTime?datetime?string}
		            <#if (user??) && (comment.ownerKey??) && (comment.ownerKey == user.key)>
		              (<a href="comment-delete?entryKey=${faq.key}&commentKey=${comment.key}">delete</a>)
		            </#if>
                    ${comment.bodyAsMarkdown}
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
		            ${audit.body} by ${audit.ownerName} on ${audit.lastModifiedTime?datetime?string}<br/><br/>
		        </#list>
		    </#if>

		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "../../includes/bottom.ftl" />
</body>
</html>