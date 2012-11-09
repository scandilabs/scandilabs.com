<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Scandi Labs Contact</title>
        <link type="text/css" rel="stylesheet" href="css/site.css" media="screen, projection">
        <link type="text/css" rel="stylesheet" href="css/top.css" media="screen, projection">
    </head>
    <body>
        <div id="outerContent">
            
            <?php include("include/top.php"); ?>  
            
            <div id="content"> 
        
                <div class="blurb">
                    <h1>Contact Us</h1>

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

            </div>  <!-- content -->
            
            <?php include("include/bottom.php"); ?>  
            
        </div> <!-- outerContent -->                
    </body>
</html>
