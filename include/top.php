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
						<h2>what we do</h2>
						<p>web, b2b, enterprise, mobile</p>		
					</a>
				</li>	
				<li>
					<a 
						<?php if($page=='/how.php') echo "class='current'"; ?> 
						href="how">
						<h2>how we work</h2>
						<p>ux, agile, on tap</p>
					</a>
				</li>	
				<li>
					<a 
						<?php if($page=='/why.php') echo "class='current'"; ?> 
						href="why"><h2>why we are different</h2>
						<p>framework, value, experience</p>		
					</a>
				</li>	
            </ul>       
        </div>