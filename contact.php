<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Scandi Labs - Contact</title>
        <link type="text/css" rel="stylesheet" href="css/site.css" media="screen, projection">
        <link type="text/css" rel="stylesheet" href="css/top.css" media="screen, projection">
        <link type="text/css" rel="stylesheet" href="css/contact.css" media="screen, projection">

        <script src="js/jquery-1.8.2.js"></script>
        <script type="text/javascript" src="js/site.js"></script>
		<?php include("include/analytics.php"); ?>
    </head>
    <body>
    <?php include("include/top.php"); ?>  
            
        <div id="content"> 
    	
	    	<div class="blurb">
                <h1>Contact Us</h1>                
                <p>
                    Mads Kvalsvik, President<br/>
                    <span class="label">Phone:</span> <a href="tel:617 682 0310">(617) 682-0310</a><br/>
                    <span class="label">Fax:</span> (617) 297-0013<br/>
                    <br/>
                    Scandi Labs, Inc. <br/>
                    155 5th Street<br/>
                    Cambridge, MA 02141<br/>
            	</p>
            	<p>Get in touch via your favorite social network: &nbsp;
                    <a href="http://www.facebook.com/ScandiLabs" target="_new"><img src="img/fb_1.png" /></a>
                    <a href="https://twitter.com/scandilabs" target="_new"><img src="img/twitter_1.png" /></a>
                    <a href="https://plus.google.com/104908377553538789362" target="_new"><img src="img/google_plus.png" /></a>
                    <a href="https://github.com/scandilabs" target="_new"></a>                            
                </p>
                <p>
                	Or send us an e-mail by filling out this form:
                </p>

                <form action="contact-send.php" method="post">
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
                        <input name="subject" value="<?php echo $_GET['subject']; ?>" />
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
            
        <?php include("include/bottom.php"); ?>  
    </body>
</html>
