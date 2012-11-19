<?php 
  $page = $_SERVER["PHP_SELF"];
?>
    <div class="blurb">
        <ul id="why-tabs" class="tabs">
        	<!--
            <li class="title">
                <?php if($page=='/about.php'): ?>
                    About Us
                <?php else: ?>
                    <a href="about">About Us</a>
                <?php endif; ?>                    
            </li>
            -->
            
            <li
                <?php if($page=='/about.php') echo "class='active'"; ?> 
            >
                <a href="about">About Us</a>
            </li>
            <li
                <?php if($page=='/technology.php') echo "class='active'"; ?> 
            >
                <a href="technology">Technology</a>
            </li>
            <li
                <?php if($page=='/speed-vs-scale.php') echo "class='active'"; ?> 
            >
                <a href="speed-vs-scale">Speed and Scale</a>
            </li>
            <li
                <?php if($page=='/catamaran.php') echo "class='active'"; ?> 
            >
                <a href="catamaran">Catamaran Framework</a>
            </li>
        </ul>
        <div style="clear: both;"></div>
    </div>

