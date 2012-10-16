<?php 
  $page = $_SERVER["PHP_SELF"];
?>

        	<div id="crumbs">
        		<?php if ($page=='/index.php'): ?>
					<!-- no breadcrumb on home page -->

        		<?php elseif ($page=='/what.php'): ?>
        			<p><a href="index">home</a> : what we do</p>

        		<?php elseif ($page=='/consumer-web.php'): ?>
        			<p><a href="index">home</a> : <a href="what">what we do</a> : consumer web</p>

        		<?php elseif ($page=='/enterprise.php'): ?>
        			<p><a href="index">home</a> : <a href="what">what we do</a> : b2b and enterprise</p>

        		<?php elseif ($page=='/how.php'): ?>
        			<p><a href="index">home</a> : how we work</p>

        		<?php elseif ($page=='/why.php'): ?>
        			<p><a href="index">home</a> : why we are different</p>

        		<?php elseif ($page=='/speed-vs-scale.php'): ?>
        			<p><a href="index">home</a> : <a href="why">why we are different</a> : speed and scale</p>

        		<?php elseif ($page=='/technology-stack.php'): ?>
        			<p><a href="index">home</a> : <a href="why">why we are different</a> : technology stack</p>

				<?php endif; ?>	
        	</div>