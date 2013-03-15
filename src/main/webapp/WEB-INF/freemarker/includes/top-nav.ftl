        <div id="outerContent">
        	
	        <div id="border">

				<div id="headerOuter">
			        <div id="header">
			        
			        	<div>
			        				        
				            <div id="logoBox" >
				                <a href="${parentSiteBase}/index" ><img src="${parentSiteBase}/img/logo150x32.png"></a>
				            </div>   
				            <ul>
				                <li>
				                    <a 
				                        href="${parentSiteBase}/what">
				                        <h2>What We Do</h2>
				                    </a>
				                </li>   
				                <li>
				                    <a 
				                        href="${parentSiteBase}/how">
				                        <h2>How We Work</h2>
				                    </a>
				                </li>   
				                <li>
				                    <a 
				                        <#if (!page??)>class='current'</#if> 
				                        href="${javaSiteBase}/">
				                        <h2>Java</h2>
				                    </a>
				                </li>   
				                <li>
				                    <a 
				                        <#if (page?? && page == "blog")>class='current'</#if>
				                        href="${blogSiteBase}/blog">
				                        <h2>Blog</h2>
				                    </a>
				                </li>   
				                <li>
				                    <a 
				                        href="${parentSiteBase}/clients">
				                        <h2>Clients</h2>
				                    </a>
				                </li>   
				                <li>
				                    <a 
				                        href="${parentSiteBase}/about">
				                        <h2>About</h2>
				                    </a>
				                </li>   
				            </ul>
				               
			            </div>

			        </div>
				</div>
				<div class="clearfix"></div>
				
				<div id="pageCanvas">
