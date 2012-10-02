<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Scandi Labs Contact</title>
        <link type="text/css" rel="stylesheet" href="css/site.css" media="screen, projection">
    	<style type="text/css">
    		body {
    			background-image:url('../img/background2.jpg');
    		}
		</style>
    </head>
    <body>
        
        <?php include("include/top.php"); ?>
        
        <div id="content">
    	
	    	<div id="contentHeadingBox">
                <h1>contact</h1>                
	    	</div>
	        
	        <div id="contentBodyBox">
		        <?php include("include/left.php"); ?>
	        	
	            <div class="copyBox" style="text-align:center; margin-top:20px;">

<?php

// Contact subject
$subject ="$subject"; 

// Details
$message="$detail";

// Mail of sender
$mail_from="$customer_mail"; 

// From 
$header="from: $name <$mail_from>";

// Enter your email address
$to ='mkvalsvik@scandilabs.com';
$send_contact=mail($to,$subject,$message,$header);

// Check, if message sent to your email 
// display message "We've recived your information"
if($send_contact){
echo "We've received your contact information";
}
else {
echo "ERROR";
}
?>
		        </div>
            </div>
        </div>        
    </body>
</html>
