<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <#include "includes/head.ftl" />
        <title>ScandiLabs : Home</title>   
        <link type="text/css" rel="stylesheet" href="static/css/index.css" media="screen, projection">
        <script type="text/javascript" src="static/js/jcarousellite_1.0.1.min.js"></script>        
        <script type="text/javascript" src="static/js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="static/js/jquery.cycle.all.js"></script>
        
        <!-- fix for border on IE10 since conditionals don't work above IE10 -->
        <script>
            if(Function('/*@cc_on return document.documentMode===10@*/')()){
              document.documentElement.className+=' ie10';
            }            
        </script>
        <style>
            .ie10 .overlayOuter {
                padding:1px 16px 1px 16px; 
            } 
        </style>
        <!-- END fix for border on IE10 since conditionals don't work above IE10 -->
        
        <!-- override nav stuff -->
        <style>

        </style>
        
        <script type="text/javascript" src="static/js/index.js"></script>
    </head>
    <body>
        
    <!-- set up absolute position container -->        
    <div style="position: absolute; top: 80px; background-color: #474f64; width: 100%; height: 380px; ">
        <!-- then position image in the middle of parent container -->
        <img style="position: relative; left: 50%; margin-left: -1020px; height: 380px; width: 2040px;" src="static/img/berg2040x380med.jpg" />
    </div>    
    <!--
    <div class="bgImageBox" style="position:relative; overflow: hidden; top:80px; height:380px; margin-left:auto; margin-right:auto; background-color: #474f64;">
        <div style="position: absolute; left: -9999px; right: -9999px;">
            <img style="height:380px; width:100%" src="static/img/berg2040x380med.jpg" />
        </div>
    </div>
    -->
    
    
    <#include "includes/top-nav.ftl" />
            
            
    <div class="" >
        <div class="slideBlackBox">
            <div class="slideInnerWhiteBox">
                <h1 style="font-size:29px; text-align: left; margin-top: 0px; margin-bottom:24px; padding-top:24px; padding-left:40px; padding-right:10px;">
                    We retain top talent because we put people and culture first.</h1>
                <div style="padding-top: 0px; width: 100%;">
                    <div id="staffPics">
                        <img src="static/img/Prashant_sm.jpg" />
                        <img src="static/img/Hrushi_sm.png" />
                        <img src="static/img/Kailash_sm.png" />
                        <img src="static/img/Mehul_sm.png" />
                        <img src="static/img/Praful_sm.png" />
                    </div>
                    <div style="padding-top: 96px; vertical-align:top; text-align: right; width: 552px; display: inline-block;">
                        <h2 style="font-size:29px; margin-top: 0px; padding-left: 0px; padding-right: 30px; margin-bottom: 8px;">
                            What does this mean to you?<br/><br/>
                            Game-changing technical solutions, quality software, and rapid delivery.
                        </h2>                        
                    </div>
                </div>
            </div>                                            
        </div>
        
        <div id="contentBelowBgImage" style="padding-left: 40px; padding-right: 40px;">        
            
            <div id="bulletSection" class="box3">                                
                <div>
                    <h2 style="margin-left: 0px">Game-changing Solutions</h2>
                    <ul style="margin-left: 0px">
                        <li>Cambridge/MIT based solutions design staff</li>
                        <li>Rapid prototyping/wireframing</li>
                        <li>Technical architects with broad business experience</li>
                    </ul>
                </div><div>
                    <h2>Quality Software</h2>
                    <ul>
                        <li>Consistency through apprenticeship program</li>
                        <li>Low turnover, experienced staff</li>
                        <li>Developer input and design participation</li>
                    </ul>
                </div><div>
                    <h2>Rapid Delivery</h2>
                    <ul>
                        <li>We hire for talent, not for need</li>
                        <li>Full stack developers</li>
                        <li>Flat organizational structure</li>
                        <li>Direct communication channels</li>                        
                    </ul>
                </div>            
            </div>
            
            <hr style="margin-top: 30px;"></hr>

            <div class="clientLogoOuter" style="margin-top: 10px;">
                <button class="prev"><<</button>
                <div class="clientLogoContainer">
                    <div class="jCarouselLite">
                        <ul id="clientLogoList" >
                            <li>
                                <img style="margin-top: 24px; width: 157px" src="/static/img/mckesson.png"/>
                            </li>                                            
                            <li>
                                <img style="margin-top: 21px; width: 134px" src="static/img/travelclick_logo.png"/>
                            </li>                                            
                            <li>
                                <img style="margin-top: 20px; width: 134px" src="static/img/madaket_color.png"/>
                            </li>
                            <li>
                                <img style="margin-top: 8px; width:134px;" src="static/img/it_logo.gif">
                            </li>
                            <li>
                                <img style="margin-top: 28px;" src="static/img/postpost-logo.png">
                            </li>
                            <li>
                                <img style="margin-top: 0px; width: 134px" src="static/img/medventive_logo.gif"/>
                            </li>                                            
                            <li>
                                <img style="margin-top: 26px; margin-left: -6px; width:148px;" src="static/img/Snag-a-Job-Logo.gif">                 
                            </li>
                            <!--
                            <li>
                                <img style="margin-top: 0px; width: 110px" src="static/img/Speedbilly.jpg"/>
                            </li>
                            -->                                            
                        </ul>
                    </div> 
                </div>             
                <button class="next">>></button>            
            </div> 
            <div class="clearfix"></div>
            
            <hr style="margin-top: 0px;"></hr>
            <h2 style="margin-top: 30px;">Knowledge and Learning</h2>
            
            <div id="activityFeed" class="underlineLinks box3">
                <div style="background-color: #e2e2e2">
                    <h3>Blog</h3>
                    <div>
                        <p>
                            Web Framework Design Goals<br/> 
                            <span class="byline"><a href="/blog/web-framework-design-goals">April 3, 2013</a> by <a href="/about/management">mkvalsvik</a></span>
                        </p>
                        <p>
                            Maintenance Costs and Software Development Speed<br/> 
                            <span class="byline"><a href="/blog/why-do-startups-create-software-so-much-faster-than-enterprise-it-shops">March 15, 2013</a> by <a href="/about/management">mkvalsvik</a></span>
                        </p>
                        <p>
                            <a href="/blog">More >></a>
                        </p>
                    </div>                    
                </div><div style="background-color: #ffffff">
                    <h3>Social Media <img src="static/img/new-window.png" alt="Links open in a new window"></h3>
                    <div>                    
                        <p>
                            5 ways SAS scaled agile scrum <a target="_blank" href="http://zite.to/1alMRmN">http://zite.to/1alMRmN</a><br/> 
                            <span class="byline">October 14, 2013 by <a target="_blank" href="http://twitter.com/scandilabs">@scandilabs</a></span>
                        </p>
                        <p>
                            Maven and Eclipse, Top Eclipse Kepler Feature #5 Ç EclipseSource Blog <a target="_blank" href="http://flip.it/a097e">http://flip.it/a097e</a><br/> 
                            <span class="byline">June 18, 2013 by <a target="_blank" href="http://twitter.com/scandilabs">@scandilabs</a></span>
                        </p>
                        <p>
                            <a target="_blank" href="http://twitter.com/scandilabs">More >></a>
                        </p>
                    </div>
                </div><div style="background-color: #e2e2e2">
                    <h3>Team Learning</h3>
                    <div>
                        <p>
                            How to Creating New AWS Hosting Environment and Deploy Application<br/> 
                            <span class="byline"><a href="/technology/knowledge/How_to_Creating_New_AWS_Hosting__Environment_and_D">November 27, 2013</a> by <a href="/about/management">pthakare</a></span>
                        </p>
                        <p>    
                            Using jQuery to bind Javascript events to html elements<br/> 
                            <span class="byline"><a href="/technology/knowledge/Using_jQuery_to_bind_Javascript_events_to_html_ele">July 9, 2013</a> by <a href="/about/management">kthok</a></span>
                        </p>
                        <p">
                            How to include google map in a webpage?<br/> 
                            <span class="byline"><a href="/technology/knowledge/How_to_include_googl">June 26, 2013</a> by <a href="/about/management">pmurkute</a></span>
                        </p>        
                        <p>
                            <a href="/technology/knowledge">More >></a>
                        </p>
                                    
                    </div>
                </div>
            </div> <!-- Activity Feed -->
            
            
            <hr style="margin-top: 30px;"></hr>
            <h2 style="margin-top: 30px;">Client Testimonials</h2>
            
            <!-- testimonials -->
            <div class="box2">
                <div class="quote" style="padding-right:15px;">
                    <p>
                        "ScandiLabs has worked tirelessly with our product team to build a Healthcare IT solution for thousands of doctors and hundreds of insurance companies.
                    </p>
                    <p>
                        For us, these guys have been more cost-effective than building an internal team."
                    </p>
                    <p style="font-size:12px;">
                        <span style="font-weight:600">Jim Dougherty</span><br/>
                        Founder, Madaket Health<br/>
                        Entrepreneur in Residence, <br/>
                        Center for MIT Entrepreneurship<br/>                
                    </p>
                </div><div class="quote" style="padding-left:15px;">
                    <p>
                        "The team from ScandiLabs helped us put together the right solution with minimal impact on our own resources.
                    </p>  
                    <p>
                        The combination a Boston-based solution designer and developers in India worked well for our monitoring application."
                    </p>
                    <p style="font-size:12px;">
                        <span style="font-weight:600">Bernard Chien</span><br/>
                        CTO, Medventive, a McKesson Company<br/>
                    </p>
                </div>
            </div> <!-- testimonials -->            

        </div> <!-- contentBelowBgImage -->     
    </div>

    <#include "includes/bottom.ftl" />
    </div> <!-- outerContent -->        
    </body>
</html>
