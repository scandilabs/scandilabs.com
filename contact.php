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
	        	
	            <div class="copyBox">
	            <div>
	            	<div style="float:left; ">
		           	<p style="margin-bottom:0px;">
	        			Mads Kvalsvik (Founder)     			
		        	</p> 
		        	</div>
		        	<div style="float:right;">
		           	<p style="margin-bottom:0px; ">
	        			Phone: 978 206 1090      			
		        	</p> 
		        	</div>
		        </div>
		        <div style="margin-top:61px;">
		        	<form action="contact-send.php" method="post">
		        		<div style="margin-top:30px; margin-bottom:10px;">
		        			<label for="name" >Name</label>
		        			<input name="name" style="background-color: #333; color:#FFF; opacity:.6;width:100%;float:right; border:1px solid black; height:20px;" />
						</div>
		        		<div style="margin-bottom:10px;">
		        			<label for="customer_mail">Email</label>
		        			<input name="customer_mail"style="background-color: #333; color:#FFF; opacity:.6;width:100%;float:right; border:1px solid black; height:20px;"/>
						</div>
		        		<div style="margin-bottom:10px;">
		        			<label for="subject">Subject</label>
		        			<input name="subject" style="background-color: #333; color:#FFF; opacity:.6;width:100%;float:right; border:1px solid black; height:20px;"/>
						</div>
		        		<div style="margin-bottom:10px;">
		        			<label for="detail">Detail</label>
		        			<textarea name="detail" cols="50" rows="4" id="detail"style="background-color: #333; color:#FFF; opacity:.6;width:100%;float:right; border:1px solid black;height: 20%;" ></textarea>	        			
						</div>
		        		<div>
		        			<label for="submit"></label>
		        			<input style="background-color: #333; color:#FFF; opacity:.6; float:left;  margin-right: 4px; border:1px solid black; margin-top: 4px; margin-left: 0px; " type="reset" name="Submit2" value="reset">
		        			<input style="background-color: #333; color:#FFF; opacity:.6; float:left;  margin-right: 20px; border:1px solid black; margin-top: 4px; "type="submit" name="submit_btn" value="send"/>
						</div>

		        	</form>
		        </div>
		        </div>
            </div>
        </div>        
    </body>
</html>
