<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <#include "includes/head.ftl" />
        <title>ScandiLabs : Home</title>   
        <link type="text/css" rel="stylesheet" href="static/css/index.css" media="screen, projection">
        <link rel="stylesheet" type="text/css" href="http://sorgalla.com/jcarousel/examples/basic/jcarousel.basic.css">
        <!-- <script type="text/javascript" src="static/js/jquery-1.4.js"></script> -->
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
        
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
                padding-left: 162px; 
                left: 162px;
                display: inline-block;                
            }
        </style>
        
        <!-- jcarousel -->
        <style>
.jcarousel-wrapper {
    margin: 20px auto;
    position: relative;
    border: 10px solid #fff;
    -webkit-border-radius: 5px;
       -moz-border-radius: 5px;
            border-radius: 5px;
    -webkit-box-shadow: 0 0 2px #999;
       -moz-box-shadow: 0 0 2px #999;
            box-shadow: 0 0 2px #999;
}


.jcarousel-wrapper .photo-credits {
    position: absolute;
    right: 15px;
    bottom: 0;
    font-size: 13px;
    color: #fff;
    text-shadow: 0 0 1px rgba(0, 0, 0, 0.85);
    opacity: .66;
}

.jcarousel-wrapper .photo-credits a {
    color: #fff;
}

/** Carousel **/

.jcarousel {
    position: relative;
    overflow: hidden;
    width: 200px;
    height: 100px;
}

.jcarousel ul {
    width: 20000em;
    position: relative;
    list-style: none;
    margin: 0;
    padding: 0;
}

.jcarousel li {
    float: left;
}

/** Carousel Controls **/

.jcarousel-control-prev,
.jcarousel-control-next {
    position: absolute;
    top: 200px;
    width: 30px;
    height: 30px;
    text-align: center;
    background: #4E443C;
    color: #fff;
    text-decoration: none;
    text-shadow: 0 0 1px #000;
    font: 24px/27px Arial, sans-serif;
    -webkit-border-radius: 30px;
       -moz-border-radius: 30px;
            border-radius: 30px;
    -webkit-box-shadow: 0 0 2px #999;
       -moz-box-shadow: 0 0 2px #999;
            box-shadow: 0 0 2px #999;
}

.jcarousel-control-prev {
    left: -50px;
}

.jcarousel-control-next {
    right: -50px;
}

.jcarousel-control-prev:hover span,
.jcarousel-control-next:hover span {
    display: block;
}

.jcarousel-control-prev.inactive,
.jcarousel-control-next.inactive {
    opacity: .5;
    cursor: default;
}

/** Carousel Pagination **/

.jcarousel-pagination {
    position: absolute;
    bottom: 0;
    left: 15px;
}

.jcarousel-pagination a {
    text-decoration: none;
    display: inline-block;
    
    font-size: 11px;
    line-height: 14px;
    min-width: 14px;
    
    background: #fff;
    color: #4E443C;
    border-radius: 14px;
    padding: 3px;
    text-align: center;
    
    margin-right: 2px;
    
    opacity: .75;
}

.jcarousel-pagination a.active {
    background: #4E443C;
    color: #fff;
    opacity: 1;
    text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.75);
}        
        </style> <!-- jcarousel -->
        
        <script type="text/javascript" src="static/js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="static/js/jquery.cycle.all.js"></script>
        <!-- <script type="text/javascript" src="static/js/jquery.jcarousel.min.js"></script> -->
        <script type="text/javascript" src="http://sorgalla.com/jcarousel/dist/jquery.jcarousel.min.js"></script>     
        <!-- <script type="text/javascript" src="http://sorgalla.com/jcarousel/examples/basic/jcarousel.basic.js"></script> -->   
        <script type="text/javascript" src="static/js/index.js"></script>
    </head>
    <body>
        
    
    <div class="bgImageBox" style="position:absolute; top:80px; width:100%; background-color: #474f64;">
        <div style="width:2040px; margin-left:auto; margin-right:auto;">
            <img style="height:495px; width:100%" src="static/img/berg2040x1240med.jpg" />
        </div>                            
    </div>
    
    
    <#include "includes/top-nav.ftl" />
            
            
    <div class="" >
        <div class="slideBlackBox">
            <div class="slideInnerWhiteBox">
                <h1 style="font-size:38px; text-align: left; margin-top: 0px; margin-bottom:24px; padding-top:30px; padding-left:30px; padding-right:10px;">
                    We are a different kind of global team.</h1>
                <div style="padding-top: 0px; width: 100%;">
                    <div id="staffPics">
                        <img src="static/img/Prashant_sm.jpg" />
                        <img src="static/img/Hrushi_sm.png" />
                        <img src="static/img/Kailash_sm.png" />
                        <img src="static/img/Mehul_sm.png" />
                        <img src="static/img/Praful_sm.png" />
                    </div>
                    <div style="padding-top: 70px; vertical-align:top; text-align: right; width: 446px; display: inline-block;">
                        <h2 style="font-size:30px; margin-top: 0px; padding-left: 30px; padding-right: 30px; margin-bottom: 8px;">
                            We put individual employees and<br/> company culture first.
                        </h2>                        
                    </div>
                </div>       
                <h2 style="font-size:30px; margin-top: 0px; padding-left: 30px; padding-right: 30px; text-align: left; margin-bottom: 30px;">
                    So that we retain top talent to design game-changing solutions and deliver quality software quickly.
                </h2>  
                
            </div>                                            
        </div>
        
        <div id="contentBelowBgImage" style="padding-left: 40px; padding-right: 40px;">        
            
            <div style="margin-top: 40px; font-size: 12pt;">                                
                <div style="display: inline-block; width: 32%">
                    <h3 style="">Game-changing Solutions</h3>
                    <ul>
                        <li>Flat organizational structure</li>
                        <li>Full stack developers</li>
                        <li>Hiring for talent, not for need</li>
                        <li>In-network hiring</li>
                        <li>Apprenticeship program ensures consistency</li>
                    </ul>
                </div>
                <div style="display: inline-block;">
                    &nbsp;&nbsp;
                </div>
                <div style="display: inline-block; width: 32%">
                    <h3 style="">Quick Delivery</h3>
                    <ul>
                        <li>Flat organizational structure</li>
                        <li>Full stack developers</li>
                        <li>Hiring for talent, not for need</li>
                        <li>In-network hiring</li>
                        <li>Apprenticeship program ensures consistency</li>
                    </ul>
                </div>
                <div style="display: inline-block;">
                    &nbsp;&nbsp;
                </div>
                <div style="display: inline-block; width: 32%; vertical-align: top;">
                    <h3 style="">People and Culture</h3>
                    <ul>
                        <li>Culture modeled on US-based tech companies</li>
                        <li>Risk-taking and individual initiative</li> 
                        <li>Communication skills</li>
                        <li>Low turnover</li>
                    </ul>
                </div>            
            </div>
            
            <hr style="margin-top: 30px;"></hr>

                    <!--
                    <li class="" style="">
                        <img style="margin-top: 19px; width: 43px; padding-right: 8px;" src="static/img/nav_left_arrow.png"/>
                    </li>
                    -->                                            

            
            <div class="jcarousel-wrapper">
                <ul id="clientLogos" class="jcarousel" data-jcarousel="true" style="display:-webkit-box; margin-top: 29px; margin-left: 7px;">
                    <li class="box5" style="margin-left: 25px;">
                        <img style="margin-top: 24px; width: 157px" src="/static/img/mckesson.png"/>
                    </li>                                            
                    <li class="box5" style="">
                        <img style="margin-top: 21px; width: 134px" src="static/img/travelclick_logo.png"/>
                    </li>                                            
                    <li class="box5" style="">
                        <img style="margin-top: 0px; width: 134px" src="static/img/medventive_logo.gif"/>
                    </li>                                            
                    <li class="box5" style="width: 171px;">
                        <img style="margin-top: 20px; width: 134px" src="static/img/madaket_color.png"/>
                    </li>
                </ul> 
                <a href="#" class="jcarousel-control-prev inactive" data-jcarouselcontrol="true">prev</a>
                <a href="#" class="jcarousel-control-next" data-jcarouselcontrol="true">next</a>
                <p class="jcarousel-pagination" data-jcarouselpagination="true">
                    <a href="#1" class="">1</a>
                    <a href="#2" class="active">2</a>
                    <a href="#3" class="">3</a>
                    <a href="#4" class="">4</a><a href="#5" class="">5</a><a href="#6" class="">6</a></p>
            </div>             
            
            <hr style="margin-top: 30px;"></hr>
            <h3 style="margin-top: 30px;">Activity Feeds</h3>
            
            <div id="activityFeed" class="underlineLinks slideBlackBox" style="display:-webkit-box; margin-top: 0px;">
                <div class="box3" style="background-color: #dddddd">
                    <h1 style="padding-top: 16px; margin: 16px; font-size:16px;">Team Sharing</h1>
                    <div style="margin: 16px; font-size:14px;">
                    
                        <p style="">
                            <a href="#">How to configure Tomcat on EC2</a><br/> 
                            <span style="font-size:12px">(12-Jan-2014 by <a href="#">mgayate</a></span>)
                        </p>
                        <p style="">    
                            <a href="#">How to configure ngix</a><br/> 
                            <span style="font-size:12px">(12-Jan-2014 by <a href="#">mgayate</a></span>)
                        </p>
                        <p style="">
                            <a href="#">How to configure Tomcat on EC2 in your face twice on Sunday</a><br/> 
                            <span style="font-size:12px">(12-Jan-2014 by <a href="#">mgayate</a></span>)
                        </p>                    
                    </div>
                </div>                                            
                
                <div class="box3" style="background-color: #ffffff">
                    <h1 style="padding-top: 16px; margin: 16px; font-size:16px;">Social Media</h1>
                    <div style="margin: 16px; font-size:14px;">
                    
                        <p style="">
                            5 ways SAS scaled agile scrum <a href="#">http://zite.to/1alMRmN</a><br/> 
                            <span style="font-size:12px">(12-Jan-2014 by <a href="#">mgayate</a></span>)
                        </p>
                        <p style="">    
                            Maven and Eclipse, Top Eclipse Kepler Feature #5 Ç EclipseSource Blog <a href="#">http://flip.it/a097e</a><br/> 
                            <span style="font-size:12px">(12-Jan-2014 by <a href="#">mgayate</a></span>)
                        </p>
                    </div>
                </div>
                
                <div class="box3" style="background-color: #dddddd">
                    <h1 style="padding-top: 16px; margin: 16px; font-size:16px;">Blog</h1>
                    <div style="margin: 16px; font-size:14px;">
                    
                        <p style="">
                            <a href="#">Web Framework Design Goals</a><br/> 
                            <span style="font-size:12px">(12-Jan-2014 by <a href="#">mkvalsvik</a></span>)
                        </p>
                        <p style="">    
                            <a href="#">Maintenance Costs and Software Development Speed</a><br/> 
                            <span style="font-size:12px">(12-Jan-2014 by <a href="#">mkvalsvik</a></span>)
                        </p>
                    </div>
                </div>
            </div> <!-- Activity Feed -->
            
            
            <hr style="margin-top: 30px;"></hr>
            
            <!-- testimonials -->
            <div class="slideBlackBox" style="display:-webkit-box; margin-top: 30px;">
                <div class="box2">
                    <p style="font-size:16px; font-weight:bold;">
                        "ScandiLabs has worked tirelessly with our product team to build a Healthcare IT solution for thousands of doctors and hundreds of insurance companies.
                    </p>
                    <p style="font-size:16px; font-weight:bold;">
                        Using these guys has been far more cost-effective than building an internal team."
                    <p style="font-size:12px;">
                        <span style="font-weight:600">Jim Dougherty</span><br/>
                        Founder, Madaket Health<br/>
                        Entrepreneur in Residence, <br/>
                        Center for MIT Entrepreneurship<br/>                
                    </p>
                </div>                                            
                
                <div class="box2" style="padding-left:38px;">
                    <p style="font-size:16px; font-weight:bold;">
                        "The team from ScandiLabs helped us put together the right solution with minimal impact on our own resources.
                    </p>  
                    <p style="font-size:16px; font-weight:bold;">
                        The combination Boston-based designers and developers in India has worked really well for our application."
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
