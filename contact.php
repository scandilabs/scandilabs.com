<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>ScandiLabs : Contact</title>
        <link type="text/css" rel="stylesheet" href="css/site.css" media="screen, projection">
        <link type="text/css" rel="stylesheet" href="css/top.css" media="screen, projection">
        <link type="text/css" rel="stylesheet" href="css/contact.css" media="screen, projection">

		<?php include("include/analytics.php"); ?>
    </head>
    <body>
    <?php include("include/top.php"); ?>  
            
        <div id="content"> 
    	
            <ul class="leftNav">
                <li><a href="about">Company</a></li>
                <li><a href="about-management">Management</a></li>
                <li><a href="about-partners">Partners</a></li>
                <li><a href="careers">Careers</a></li>
                <li><a class='current' href="contact">Contact</a></li>
            </ul><div id="mainCol">
                
                <h2 class="noTopMargin">Contact Us</h2>
                
                <div class="twoColLeft">
                    <h4>United States</h4>
                    <p>
                        Mads Kvalsvik, Owner<br/>
                        <span class="label">Phone:</span> <span class="blackLink"><a href="tel:617 682 0310">(617) 682-0310</a></span><br/>
                        <span class="label">Fax:</span> (617) 297-0013<br/>
                        <br/>
                        ScandiLabs, Inc. <br/>
                        122 Prospect Street<br/>
                        Acton, MA 01720<br/>
                        United States<br/>
                    </p>
                </div>
                <div class="twoColRight">
                    <h4>India</h4>
                    <p>
                        Vikram Shinde, Operations Manager<br/>
                        <span class="label">Phone:</span> <span class="blackLink"><a href="tel:617 682 0310">(617) 682-0310</a></span><br/>
                        <span class="label">Fax:</span> (617) 297-0013<br/>
                        <br/>
                        ScandiLabs<br/>
                        27/365, Netaji Nagar, Wanworie,<br/> 
                        Pune - 411040 Maharashtra<br/>
                        India
                    </p>                    
                </div>
                <br/>
                <div class="twoColLeft">
                    <a href="https://twitter.com/scandilabs" target="_new"><img src="img/twitter_1.png" /></a>
                    <a href="http://www.facebook.com/ScandiLabs" target="_new"><img src="img/fb_1.png" /></a>
                    <a href="http://www.linkedin.com/company/scandilabs" target="_new"><img src="img/linkedin24.png" /></a>
                    <a href="https://plus.google.com/104908377553538789362" target="_new"><img src="img/google_plus.png" /></a>
                    <!-- <a href="https://github.com/scandilabs" target="_new"></a> -->                            
                </div>
                <br/><br/>
                <p>
                    Or send us an e-mail:
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
