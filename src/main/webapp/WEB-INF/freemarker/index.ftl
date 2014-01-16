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
            #header {
                height:56px;
            }
            
            html {
                overflow-x: hidden;
            }            

            .slideOuter {
            }
            
            .bgImageBoxOuter {
                width:100%;
                margin-left:auto;
                margin-right:auto;
            }
            
            .overlay {
                font-weight: 500;
                font-size:17px;
                color: black;
                font-style:normal;
            }
            
            #outerContent {
                /* compensate for 14px scrollbar on chrome 
                width: 979px;
                padding-right: 15px;
                
                margin-left: auto;
                margin-right: auto;
                */
            }
            
            #pageCanvas {
                min-height: 600px;
                padding-left: 20px;
                padding-right: 20px;
                width: 920px;
            }
            
            .box2 {
                width: 400px;
                background-color:white;
            }
            
            .box3 {
                min-height:200px;
                width: 278px;
                background-color:white;
                padding-bottom: 2px;
            }
            
            .box5 {                
                width: 178px;
                background-color:white;
            }            
            
            .boxDelim {
                width: 7px;
                /*background-color:#2e3235;*/
                background-color:#fff;
            }
            
            #staffPics {
                width: 304px; 
                height: 251px;
                padding-left: 60px; 
                left: 60px;
                display: inline-block;                
            }
        </style>
        
        <script type="text/javascript" src="static/js/index.js"></script>
    </head>
    <body>
        
    
    <div class="bgImageBox" style="position:absolute; top:80px; width:100%; background-color: #474f64;">
        <div style="width:2040px; margin-left:auto; margin-right:auto;">
            <img style="height:380px; width:100%" src="static/img/berg2040x1240med.jpg" />
        </div>                            
    </div>
    
    
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
                <!--       
                <h2 style="font-size:30px; margin-top: 0px; padding-left: 30px; padding-right: 30px; text-align: left; margin-bottom: 30px;">
                    Game-changing technical design and rapid delivery.
                </h2>
                -->  
                
            </div>                                            
        </div>
        
        <div id="contentBelowBgImage" style="padding-left: 40px; padding-right: 40px;">        
            
            <div id="bulletSection">                                
                <div>
                    <h3 style="">Game-changing Solutions</h3>
                    <ul>
                        <li>Cambridge/MIT based solutions design staff</li>
                        <li>Rapid prototyping/wireframing</li>
                        <li>Technical architects with broad business experience</li>
                    </ul>
                </div>
                <div style="width: 1%">
                    &nbsp;
                </div>
                <div>
                    <h3 style="">Quality Software</h3>
                    <ul>
                        <li>Consistency through apprenticeship program</li>
                        <li>Low turnover, experienced staff</li>
                        <li>Developer input and design participation</li>
                    </ul>
                </div>
                <div style="width: 1%">
                    &nbsp;
                </div>
                <div>
                    <h3 style="">Rapid Delivery</h3>
                    <ul>
                        <li>We hire for talent, not for need</li>
                        <li>Full stack developers</li>
                        <li>Flat organizational structure</li>
                        <li>Direct communication channels</li>
                        
                    </ul>
                </div>            
            </div>
            
            <hr style="margin-top: 30px;"></hr>

                    <!--
                    <li class="" style="">
                        <img style="margin-top: 19px; width: 43px; padding-right: 8px;" src="static/img/nav_left_arrow.png"/>
                    </li>
                    -->                                            

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
            <h3 style="margin-top: 30px;">Knowledge and Learning</h3>
            
            <div id="activityFeed" class="underlineLinks slideBlackBox" style="display:-webkit-box; margin-top: 0px;">
                <div class="box3" style="background-color: #dddddd">
                    <h1>Blog</h1>
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
                            <a target="_blank" href="/blog">More</a>
                        </p>
                    </div>
                </div>                                            
                
                <div class="box3" style="background-color: #ffffff">
                    <h1>Social Media <img src="static/img/new-window.png" alt="Links open in a new window"></h1>
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
                            <a target="_blank" href="http://twitter.com/scandilabs">More</a>
                        </p>
                    </div>
                </div>
                
                <div class="box3" style="background-color: #dddddd">
                    <h1>Team Learning</h1>
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
                            <a href="/technology/knowledge">More</a>
                        </p>
                                    
                    </div>
                </div>
            </div> <!-- Activity Feed -->
            
            
            <hr style="margin-top: 30px;"></hr>
            
            <!-- testimonials -->
            <div class="slideBlackBox" style="display:-webkit-box; margin-top: 30px;">
                <div class="box2 quote">
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
                </div>                                            
                
                <div class="box2 quote" style="padding-left:38px;">
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
