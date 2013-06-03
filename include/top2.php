<?php 
  $page = $_SERVER["PHP_SELF"];
  $javabase = "http://java.scandilabs.com";
  $blogbase = "http://blog.scandilabs.com";
?>

        <div id="outerContent">
        	
	        <div id="border">

				<div id="headerOuter">
			        <div id="header">
			            <div id="logoBox" >
			                <a href="index" ><img src="img/logo_the_scaling_shortcut.png"></a>
			            </div>   
			            <ul>
			                <li>
			                    <a 
			                        <?php if($page=='/services.php') echo "class='current'"; ?> 
			                        href="services">
			                        <h2>Services</h2>
			                    </a>
			                </li>   
			                <li>
			                    <a 
			                        href="<?php echo $javabase ?>/">
			                        <h2>Java</h2>
			                    </a>
			                </li>   
			                <li>
			                    <a 			                    	
			                        href="<?php echo $blogbase ?>/blog">
			                        <h2>Blog</h2>
			                    </a>
			                </li>   
			                <li>
			                    <a 
			                        <?php 
			                        	if(
			                        		$page=='/clients/index.php' or 
			                        		$page=='/clients/inspector-time.php' or
			                        		$page=='/clients/medventive.php' or 
			                        		$page=='/clients/postpost.php' or 
			                        		$page=='/clients/snagajob.php' or 
			                        		$page=='/clients/travelclick.php'  
										) 
			                        	echo "class='current'"; ?> 
			                        href="clients/">
			                        <h2>Clients</h2>
			                    </a>
			                </li>   
			                <li>
			                    <a 
			                        <?php 
			                        	if(
			                        		$page=='/about.php' or
			                        		$page=='/about-management.php' or
                                            $page=='/about-partners.php' or
                                            $page=='/careers.php' or
			                        		$page=='/contact.php'
		                        		) 
		                        		echo "class='current'"; ?> 
			                        href="about">
			                        <h2>About</h2>
			                    </a>
			                </li>   
			            </ul>       
			        </div>
				</div>
				<div class="clearfix"></div>
				
				<div id="pageCanvas">
