	<#assign pageRecognized=false />	
    <ul id="java-tabs" class="tabs">
        <li class="title">        
        	<#if (requestContext.requestUri?ends_with("index") || requestContext.requestUri?length < 2)>
                Welcome to ScandiLabs' Web Framework<#assign pageRecognized=true />                
            <#else>
                <a href="index">Welcome to ScandiLabs' Web Framework</a>
            </#if>                    
        </li>
        <li
        	<#if requestContext.requestUri?ends_with("tutorial")>class='active'<#assign pageRecognized=true /></#if>
        >
            <a href="tutorial">Tutorial</a>
        </li>
        <li
            <#if requestContext.requestUri?ends_with("reference")>class='active'<#assign pageRecognized=true /></#if> 
        >
            <a href="reference">Reference</a>
        </li>
        <li
            <#if requestContext.requestUri?ends_with("source")>class='active'<#assign pageRecognized=true /></#if> 
        >
            <a href="source">Source</a>
        </li>
        <li
            <#if requestContext.requestUri?ends_with("download")>class='active'<#assign pageRecognized=true /></#if> 
        >
            <a href="download">Download</a>
        </li>
        <li
            <#if (!pageRecognized)>class='active clickable'</#if> 
        >
            <a href="faqs">FAQ</a>
        </li>
    </ul>
    <div style="clear: both;"></div>

