<#import "/spring.ftl" as spring />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<#include "../../includes/head.ftl" />

    <script type="text/javascript" src="/static/js/jquery-ui-1.10.3.min.js"></script>
	<script type="text/javascript" src="/static/js/faq-edit.js"></script>
    <link type="text/css" rel="stylesheet" href="/static/css/jquery-ui-1.10.3.css" />   
    <link type="text/css" rel="stylesheet" href="/static/css/faq-edit.css" media="screen, projection">
</head>
<body>
	<#include "../../includes/top-nav.ftl" />

	<div id="content">
		<ul class="leftNav">
			
	        <div id="markdownHelp">
	          <p>Answers will be parsed with <a href="http://daringfireball.net/projects/markdown/syntax">Markdown</a>.</p>

              <p>
                  For example, start a code block with an empty line and 4 indented spaces to create a code block. Entering this:<br/>
                  <div class="codeSample">
                      Declaring a variable in Java:<br/>
                      <br/>
                      &nbsp;&nbsp;&nbsp;&nbsp;private String abc;
                  </div>
              </p>

	          
	          <p>Will be formatted like this:
	          
                    <div class="codeSample">
                        Declaring a variable in Java:
                        <pre><code>private String abc;</code></pre>
                    </div>                                          
              </p>
              <p>
                You can also begin and end a code block with three or more tildes (~~~) for the same effect (useful for stack traces -- see <a href="http://michelf.ca/projects/php-markdown/extra/#fenced-code-blocks">this reference</a>).
              </p>
	        </div> 			
		</ul><div class="mainCol">

				
			<#if message??>
				<div class="errorMessage">
				<#if message.success>
					<p class="successMessage">${message.text}</p>
				<#else>
					<p class="failureMessage">${message.text}</p>
				</#if>
				</div>
			</#if>	
		
			<form action="entry-edit" method="post">
		        <div>					
			        <label>Question</label>
			        <input type="text" size="100" tabindex=1 name="question" value="${(faq.question)!}" />
				</div>
		        <div id="answerBox">					
			        <label>Answer</label>
			        <textarea rows="20" cols="72" tabindex=1 name="answer">${(faq.answer)!}</textarea>
				</div>
				
				<table id="topicTable">
				<tr>
	                <th><label>Topic #1</label></th>
	                <th><label>Topic #2</label></th>
	                <th><label>Topic #3</label></th>
	                <th><label>Topic #4</label></th>
	            </tr>
	            <tr>
	                <td class="ui-widget">
	                    <input type="text"  tabindex=11 name="tag11" class="tagX1 tag" id="tag11" value="${(faq.tag11)!}" />
	                </td>
	                <td>
	                    <input type="text"  tabindex=21 name="tag21" class="tagX1 tag" id="tag21" value="${(faq.tag21)!}" />
	                </td>
	                <td>
	                    <input type="text"  tabindex=31 name="tag31" class="tagX1 tag" id="tag31" value="${(faq.tag31)!}" />
	                </td>
	                <td>
	                    <input type="text"  tabindex=41 name="tag41" class="tagX1 tag" id="tag41" value="${(faq.tag41)!}" />
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <input type="text"  tabindex=12 name="tag12" class="tagX2 tag" id="tag12" value="${(faq.tag12)!}" />
	                </td>
	                <td>
	                    <input type="text"  tabindex=22 name="tag22" class="tagX2 tag" id="tag22" value="${(faq.tag22)!}" />
	                </td>
	                <td>
	                    <input type="text"  tabindex=32 name="tag32" class="tagX2 tag" id="tag32" value="${(faq.tag32)!}" />
	                </td>
	                <td>
	                    <input type="text"  tabindex=42 name="tag42" class="tagX2 tag" id="tag42" value="${(faq.tag42)!}" />
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <input type="text"  tabindex=13 name="tag13" class="tagX3 tag" id="tag13" value="${(faq.tag13)!}" />
	                </td>
	                <td>
	                    <input type="text"  tabindex=23 name="tag23" class="tagX3 tag" id="tag23" value="${(faq.tag23)!}" />
	                </td>
	                <td>
	                    <input type="text"  tabindex=33 name="tag33" class="tagX3 tag" id="tag33" value="${(faq.tag33)!}" />
	                </td>
	                <td>
	                    <input type="text"  tabindex=43 name="tag43" class="tagX3 tag" id="tag43" value="${(faq.tag43)!}" />
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <input type="text"  tabindex=14 name="tag14" class="tagX4 tag" id="tag14" value="${(faq.tag14)!}" />
	                </td>
	                <td>
	                    <input type="text"  tabindex=24 name="tag24" class="tagX4 tag" id="tag24" value="${(faq.tag24)!}" />
	                </td>
	                <td>
	                    <input type="text"  tabindex=34 name="tag34" class="tagX4 tag" id="tag34" value="${(faq.tag34)!}" />
	                </td>
	                <td>
	                    <input type="text"  tabindex=44 name="tag44" class="tagX4 tag" id="tag44" value="${(faq.tag44)!}" />
	                </td>
	            </tr>
	            </table>                                                            			     
				<#if faq??>
					<input type="hidden" name="key" value="${(faq.key)!}" />
				</#if>
				<div>					
			        <label></label>
			        <input type="submit" tabindex=99 value="Save" />
			        <#if faq??>
			             <a href="entry?key=${(faq.key)!}">Cancel</a>
			        <#else>
			             <a href="../knowledge">Cancel</a>
			        </#if>
				</div>
				
			</form>

		</div> <!-- mainCol -->			
	</div> <!-- content -->
	<#include "../../includes/bottom.ftl" />
</body>
</html>