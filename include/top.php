<?php 
  $page = $_SERVER["PHP_SELF"];
?>
        <div id="header">
            <div id="logoBox" >
                <a href="index.php" ><img src="img/logo_plain.png"></a>
            </div>   
            <ul style="  font-weight: 500;">
				<li style="text-align: left;"><a 
					<?php if($page=='/projects.php') echo "class='current'"; ?> 
					href="projects.php">projects</a></li>	
				<li style="text-align: center;"><a 
					<?php if($page=='/capabilities.php') echo "class='current'"; ?> 
					href="capabilities.php">capabilities</a></li>	
				<li style="width: 22%; padding-right: 20px;"><a 
					<?php if($page=='/team.php') echo "class='current'"; ?> 
					href="team.php">team</a></li>	
				<li><a 
					<?php if($page=='/contact.php') echo "class='current'"; ?> 
					href="contact.php">contact</a></li>			
            </ul>       
        </div>