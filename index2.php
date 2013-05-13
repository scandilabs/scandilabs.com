<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
        <title>ScandiLabs : Home</title>
        <link type="text/css" rel="stylesheet" href="css/site.css" media="screen, projection">
        <link type="text/css" rel="stylesheet" href="css/top.css" media="screen, projection">
        <link type="text/css" rel="stylesheet" href="css/index.css" media="screen, projection">
        <link type="text/css" rel="stylesheet" href="css/rotator.css" media="screen, projection">
        <!--[if IE]>
            <link rel="stylesheet" type="text/css" href="css/ie.css" />
        <![endif]-->                
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

        <script src="js/jquery-1.8.2.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.cycle.all.js"></script>
        <script type="text/javascript" src="js/index.js"></script>
		<?php include("include/analytics.php"); ?>
    </head>
    <body>
    <?php include("include/top.php"); ?>  
        	
    	<div class="slideOuter">
	        
        	<div class="slideBg">
				<div class="slideshow" style="height:610px;">
					
                    <div class="bgImageBoxOuter slide1">
                        <div class="bgImageBox">
                            <img style="height:600px; width:1360px" src="img/wfall60.jpg" />                            
                        </div>
                        
                        <div class="slideNav">
                            <span class="prevSlideNav">&nbsp;</span>
                            <span class="nextSlideNav"><img src="img/arrow_right.png" /></span>
                        </div>                    

                        <div class="overlayOuter" style="opacity: 0.6; margin-bottom: -112px; 
                          top: -768px; margin-left: 240px; width: 840px; height: 400px;">
                            
                            <p class="overlay" >
                              "Our business demands flawless execution.  ScandiLabs proved time and time again that they are experienced and creative problem solvers who deliver high quality code."
                            </p>                                             
                            <p class="overlay overlaySignature" >
                                Bernard Chien, CTO<br/>
                                MedVentive, a McKesson Company                      
                            </p>                                
                            
                        </div>  
                        
                    </div>
                  					
					
                    <div class="bgImageBoxOuter slide2">
                        <div class="bgImageBox">
                            <img style="height:600px; width:1360px" src="img/berg60.jpg" />
                        </div>
                        
                        <div class="slideNav">
                            <span class="prevSlideNav"><img src="img/arrow_left.png" /></span>
                            <span class="nextSlideNav"><img src="img/arrow_right.png" /></span>
                        </div>                    

                        <div class="overlayOuter" style="opacity: 0.6; margin-bottom: -112px; 
                          top: -768px; margin-left: 240px; width: 840px; height: 400px;">
                            
                            <p class="overlay">
                                ScandiLabs understood our business needs right away, and got productive FAST."
                            </p>
                            <p class="overlay overlaySignature">
                                Thomas Fredell, CTO<br/>
                                SnagAJob                        
                            </p>                            
                        </div>                        

                    </div>    
  
                    <div class="bgImageBoxOuter clearIe slide3">
                        <div class="bgImageBox">
                            <img style="height:600px; width:1360px" src="img/kvik30.jpg" />
                        </div>
                        
                        <div class="slideNav">
                            <span class="prevSlideNav"><img src="img/arrow_left.png" /></span>
                            <span class="nextSlideNav"><img src="img/arrow_right.png" /></span>
                        </div>                    

                        <div class="overlayOuter" style="opacity: 0.8; margin-bottom: -112px; 
                          top: -768px; margin-left: 240px; width: 840px; height: 400px;">
                            
                            <p class="overlay">
                              "ScandiLabs provided a full tech-team-in-a-box which helped me launch my Healthcare IT startup quickly."
                            </p>
                                
                            <p class="overlay overlaySignature">
                                Jim Dougherty, Founder<br/>
                                Madaket Health                      
                            </p>
                                                       
                        </div>                        
                    </div>   

	        	</div>
        	</div>		        	

        </div> <!-- slideOuter -->
    
	<?php include("include/bottom.php"); ?>        
    </body>
</html>
