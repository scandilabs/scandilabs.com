<?php 
  $page = $_SERVER["PHP_SELF"];
?>

        <div id="outerContent">
        	
	        <div id="border">

				<div id="headerOuter">
			        <div id="header">
			            <div id="logoBox" >
			                <a href="index" ><img src="img/logo246x43_transp.png"></a>
			            </div>   
			            <ul>
			                <li>
			                    <a 
			                        <?php if($page=='/what.php') echo "class='current'"; ?> 
			                        href="what">
			                        <h2>What We Do</h2>
			                    </a>
			                </li>   
			                <li>
			                    <a 
			                        <?php if($page=='/how.php') echo "class='current'"; ?> 
			                        href="how">
			                        <h2>How We Work</h2>
			                    </a>
			                </li>   
			                <li>
			                    <a 
			                        href="http://java.scandilabs.com/">
			                        <h2>Java</h2>
			                    </a>
			                </li>   
			                <li>
			                    <a 
			                    	<?php if($page=='/blog.php') echo "class='current'"; ?>
			                        href="blog">
			                        <h2>Blog</h2>
			                    </a>
			                </li>   
			                <li>
			                    <a 
			                        <?php if($page=='/clients.php') echo "class='current'"; ?> 
			                        href="clients">
			                        <h2>Clients</h2>
			                    </a>
			                </li>   
			                <li>
			                    <a 
			                        <?php if($page=='/about.php') echo "class='current'"; ?> 
			                        href="about">
			                        <h2>About</h2>
			                    </a>
			                </li>   
			            </ul>       
			        </div>
				</div>
				<div class="clearfix"></div>
				
				<div id="pageCanvas">
