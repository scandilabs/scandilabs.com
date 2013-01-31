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
			                        <?php if($page=='/consumer-web.php') echo "class='current'"; ?> 
			                        <?php if($page=='/enterprise.php') echo "class='current'"; ?> 
			                        <?php if($page=='/it-consulting.php') echo "class='current'"; ?> 
			                        <?php if($page=='/managed.php') echo "class='current'"; ?> 
			                        href="what">
			                        <h2>What We Do</h2>
			                        <p>Web, B2B, Cloud, Mobile</p>      
			                    </a>
			                </li>   
			                <li>
			                    <a 
			                        <?php if($page=='/how.php') echo "class='current'"; ?> 
			                        <?php if($page=='/strategy.php') echo "class='current'"; ?> 
			                        <?php if($page=='/concept.php') echo "class='current'"; ?> 
			                        <?php if($page=='/development.php') echo "class='current'"; ?> 
			                        <?php if($page=='/quality.php') echo "class='current'"; ?> 
			                        <?php if($page=='/maintenance.php') echo "class='current'"; ?> 
			                        href="how">
			                        <h2>How We Work</h2>
			                        <p>UX, Agile, Full Stack</p>
			                    </a>
			                </li>   
			            </ul>       
			        </div>
				</div>
				<div class="clearfix"></div>
				
				<div id="pageCanvas">
