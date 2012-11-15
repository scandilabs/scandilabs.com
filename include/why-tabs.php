<?php 
  $page = $_SERVER["PHP_SELF"];
?>
    <div class="blurb">
        <ul id="why-tabs" class="tabs">
            <li class="title">
                <?php if($page=='/why.php'): ?>
                    Why We Are Different
                <?php else: ?>
                    <a href="why">Why We Are Different</a>
                <?php endif; ?>                    
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

