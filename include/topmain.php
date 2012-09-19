<?php 
  $page = $_SERVER["PHP_SELF"];
?>
        <div id="header">
            <div id="logoBox">
                <a href="index.php"><img src="img/logo_plain.png"></a>
            </div>   
            <ul style="width: 46%; font-weight: 500;">	
				<li style="width: 100%;"><a 
					<?php if($page=='/contact.php') echo "class='current'"; ?> 
					href="contact.php">contact</a></li>			
            </ul>       
        </div>