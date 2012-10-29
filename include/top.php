<?php 
  $page = $_SERVER["PHP_SELF"];
?>
        <div id="header">
            <div id="logoBox" >
                <a href="index" ><img src="img/logo_plain.png"></a>
            </div>   
            <ul>
				<li>
					<a 
						<?php if($page=='/what.php') echo "class='current'"; ?> 
						href="what">
						<h2>What We Do</h2>
						<p>Web, B2B, Cloud, Mobile</p>		
					</a>
				</li>	
				<li>
					<a 
						<?php if($page=='/how.php') echo "class='current'"; ?> 
						href="how">
						<h2>How We Work</h2>
						<p>UX, Agile, Full Stack</p>
					</a>
				</li>	
				<li>
					<a 
						<?php if($page=='/why.php') echo "class='current'"; ?> 
						href="why"><h2>Why Us</h2>
						<p>Technology, Speed</p>		
					</a>
				</li>	
            </ul>       
        </div>