<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>New Web Project</title>
        <link type="text/css" rel="stylesheet" href="css/site.css" media="screen, projection">
    	<style type="text/css">
    		body {
    			background-image:url('../img/background3.jpg');
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
	        	
	            <div class="copyBox">
		           	<p>
	        			Mads Kvalsvik (Founder)<br/>
	        			Phone: (978) 206-1090<br/>        			
		        	</p> 
		        	<form action="contact-send.php" method="post">
		        		<div>
		        			<label for="name">Name</label>
		        			<input name="name" />
						</div>
		        		<div>
		        			<label for="customer_mail">Email</label>
		        			<input name="customer_mail" />
						</div>
		        		<div>
		        			<label for="subject">Subject</label>
		        			<input name="subject" />
						</div>
		        		<div>
		        			<label for="detail">Detail</label>
		        			<textarea name="detail" cols="50" rows="4" id="detail"></textarea>	        			
						</div>
		        		<div>
		        			<label for="submit"></label>
		        			<input type="reset" name="Submit2" value="Reset">
		        			<input type="submit" name="submit_btn" value="send"/>
						</div>
		        	</form>
		        </div>
            </div>
        </div>        
    </body>
</html>
