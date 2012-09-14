<?php 
  $page = $_SERVER["PHP_SELF"];
?>

		<div id="leftNav">
			<ul>
				<li><a 
					<?php if($page=='/clarity.php') echo "class='current'"; ?> 
					href="clarity.php">CLARITY</a></li>			
				<li><a 
					<?php if($page=='/speed.php') echo "class='current'"; ?> 
					href="speed.php">SPEED</a></li>
				<li><a 
					<?php if($page=='/simplicity.php') echo "class='current'"; ?> 
					href="simplicity.php">SIMPLICITY</a></li>
			</ul>
		</div>
