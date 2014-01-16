<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <#include "includes/head.ftl" />    
        <title>ScandiLabs : Contact</title>
    </head>
    <body>
        <#assign page="about" />
      	<#include "includes/top-nav.ftl" />
            
        <div id="content"> 
    	
            <ul class="leftNav">
                <li><a href="about">Company</a></li>
                <li><a href="about/management">Management</a></li>
                <li><a href="about/partners">Partners</a></li>
                <li><a href="careers">Careers</a></li>
                <li><a class='current' href="contact">Contact</a></li>
            </ul><div class="mainCol">
                
                <h2 class="noTopMargin">Contact Us</h2>
                
                <div class="twoColLeft">
                    <h4>United States</h4>
                    <p>
                        Mads Kvalsvik, Founder and CEO<br/>
                        <span class="label" style="display: inline-block; width:50px">Phone:</span> <span class="blackLink"><a href="tel:617 682 0310">(617) 682-0310</a></span><br/>
                        <span class="label" style="display: inline-block; width:50px">Fax:</span> (617) 297-0013<br/>
                        <br/>
                        ScandiLabs, Inc. <br/>
                        155 Fifth Street<br/>
                        Cambridge, MA 02141<br/>
                        United States<br/>
                    </p>
                </div>
                <div class="twoColRight">
                    <h4>India</h4>
                    <p>
                        Praful Thakare, Operations Manager<br/>
                        <span class="label">Phone:</span> <span class="blackLink"><a href="tel:020 2680 6555">+91.20 2680 6555</a></span><br/>
                        <span class="label"></span><br/>
                        <br/>
                        ScandiLabs<br/>
                        S.F 11, Sacred World, 2nd Floor<br/> 
                        Wanworie, Pune - 411040<br/>
                        India
                    </p>                    
                </div>
                <br/>
                <div class="twoColLeft">
                    <a href="https://twitter.com/scandilabs" target="_new"><img src="static/img/twitter_1.png" /></a>
                    <a href="http://www.facebook.com/ScandiLabs" target="_new"><img src="static/img/fb_1.png" /></a>
                    <a href="http://www.linkedin.com/company/scandilabs" target="_new"><img src="static/img/linkedin24.png" /></a>
                    <a href="https://plus.google.com/104908377553538789362" target="_new"><img src="static/img/google_plus.png" /></a>
                    <!-- <a href="https://github.com/scandilabs" target="_new"></a> -->                            
                </div>
                <br/><br/>
                <p>
                    Or send us an e-mail:
                </p>
                <#if message??>
        					<#if messageSuccess>
        						<p class="successMessage">${message}</p>
        					<#else>
        						<p class="failureMessage">${message}</p>
                  </#if>
        				</#if>

                <form action="contact-send" method="post">
                    <div>
                        <label for="name" >Name</label>
                        <input name="name"  />
                    </div>
                    <div>
                        <label for="customer_mail">Email</label>
                        <input name="customer_mail" />
                    </div>
                    <div>
                        <label for="subject">Subject</label>
                        <input name="subject" value="${RequestParameters.subject!}" />
                    </div>
                    <div>
                        <label for="detail">Details</label>
                        <textarea name="detail" cols="50" rows="4" id="detail"></textarea>                       
                    </div>
                    <div>
                        <label for="submit"></label>
                        <input class="button" type="submit" name="submit_btn" value="Send"/>
                        <input class="button" type="reset" name="Submit2" value="Reset">
                    </div>    
                </form>        
            </div>            
            
        </div>  <!-- content -->    	
    	
        <#include "includes/bottom.ftl" />
    </body>
</html>
