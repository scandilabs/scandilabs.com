<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <#include "includes/head.ftl" />
        <title>ScandiLabs : Home</title>   
        <link type="text/css" rel="stylesheet" href="static/css/index.css" media="screen, projection">
        <script type="text/javascript" src="static/js/jquery-1.4.js"></script>
        <script type="text/javascript" src="static/js/jquery.githubRepoWidget.js"></script> 
        
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
            #nav {
                height: 50px;                
                width:66px;
                margin-left:643px;
                opacity: 0.9;
                top: 10px;                
            }
            
            #pageCanvas {
                background-color: #2e3235;
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
            
            html {
                overflow:hidden;
            }
            
            #outerContent {
                /* compensate for 14px scrollbar on chrome */
                width: 979px;
                padding-right: 15px;
                
                margin-left: auto;
                margin-right: auto;
            }
        </style>

        <script type="text/javascript" src="static/js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="static/js/jquery.cycle.all.js"></script>
        <script type="text/javascript" src="static/js/index.js"></script>
    </head>
    <body>
        
    <div class="bgImageBox" style="position:fixed; top:80px; width:100%; background-color: #474f64;">
        <div style="width:2040px; margin-left:auto; margin-right:auto;">
            <img style="height:100%; width:100%" src="static/img/berg2040x1240med.jpg" />
        </div>                            
    </div>
    
    <#include "includes/top-nav.ftl" />
            
        <div class="slideOuter">
            
            <div class="slideBg">
                <div class="slideshow" >
                    
                    <div class="bgImageBoxOuter slide1" >
                        
                        <div >
                            <div >
                                <div class="slideBlackBox">
                                    <div class="slideInnerWhiteBox">
                                        <h1 style="text-align:center; margin-top: 0px; margin-bottom:24px; padding-top:20px; padding-left:10px; padding-right:10px;">
                                            Develop Your Product Faster</h1>
                                        <img src="static/img/milestones2.png" style="margin-left:24px; margin-top: 10px;" />
                                    </div>                                            
                                    
                                </div>
                            </div>
                        </div>
                        
                    </div>
                            
                    <div class="bgImageBoxOuter slide2">

                        <div >
                            <div >
                                <div class="slideBlackBox">
                                    <div class="slideInnerWhiteBox">
                                        <h1 style="text-align:center; margin-top: 0px; margin-bottom:30px; padding-top:20px; padding-left:10px; padding-right:10px;">
                                            Your Team, Accelerated By Us</h1>
                                        <img src="static/img/what_we_provide.png" style="margin-left:144px;" />
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>    
  
                    
                  <div class="bgImageBoxOuter clearIe slide3">
                      <div class="slideBlackBox">                                
                        <div class="slideInnerWhiteBox" style="padding-left:40px; padding-right:40px;">
                            <div style="text-align:center; margin-top: 0px; margin-bottom:30px; padding-top:20px; padding-left:10px; padding-right:10px;">
                                <h1 style="margin:0px; display:inline-block; position:relative;">Let's Talk</h1><a href="contact"><img style="vertical-align: middle; margin-bottom: 7px; margin-left: 10px; position:relative;" src="static/img/right_hook_sm.png" /><img style="vertical-align: middle; margin-bottom: 7px; margin-left: 0px; position:relative;" src="static/img/right_hook_sm.png" /></a>
                            </div>
                            <div style="margin-top:48px; margin-bottom: 24px">
                                <div style="vertical-align:top; display:inline-block; padding-right:22px; ">
                                    <a href="clients/"><img style="width:140px" src="static/img/madaket_color.png"/></a>
                                </div>
                                <p style="font-size:14px; display:inline-block; width:75%;" class="overlay" >
                                  <span style="font-weight:600">"Together we built a Healthcare IT solution that can connect thousands of doctors to insurance companies."</span>
                                  <br/><br/>
                                   Jim Dougherty<br/>
                                    Co-Founder, Madaket Health<br/> 
                                    Entrepreneur in Residence, Center for MIT Entrepreneurship         
                                </p>
                            </div>
                            <hr/>
                            <div style="margin-top:16px; margin-bottom: 24px">
                                <div style="vertical-align:top; display:inline-block; padding-right:22px; ">
                                    <a href="clients/snagajob"><img style="width:140px" src="static/img/Snag-a-Job-Logo.gif"/></a>
                                </div>
                                <p style="font-size:14px; display:inline-block; width:75%;" class="overlay" >
                                  <span style="font-weight:600">"With ScandiLabs' help we now serve large customers better."</span>
                                  <br/><br/>
                                   Thomas Fredell<br/>
                                   CTO, SnagAJob<br/>
                                   Founder, Membly.com                                          
                                </p>
                            </div>                            
                            <hr/>
                            <div style="margin-top:16px; margin-bottom: 24px">
                                <div style="vertical-align:top; display:inline-block; padding-right:22px; ">
                                    <a href="clients/medventive"><img style="width:140px" src="static/img/medventive_logo.gif"/></a>
                                </div>
                                <p style="font-size:14px; display:inline-block; width:75%;" class="overlay" >
                                  <span style="font-weight:600">"Their solutions allow our operations team to support more clients with the same staff."</span>
                                  <br/><br/>
                                   Bernard Chien<br/>
                                   CTO, MedVentive, a McKesson Company         
                                </p>
                            </div>                            
                        </div>
                            
                      </div>

                  </div>                        
                    
               </div> <!-- .slideshow -->
            </div>                  

        </div> <!-- slideOuter -->
        
        <div class="slideNav">
            <span class="prevSlideNav"><img src="static/img/slidenav_left.png" /></span>
            <span class="nextSlideNav"><img src="static/img/slidenav_right.png" /></span>
        </div>
        
            <!-- footer include begin -->
            </div> <!-- pageCanvas -->
        </div> <!-- border -->
    </div> <!-- outerContent -->        
    </body>
</html>
