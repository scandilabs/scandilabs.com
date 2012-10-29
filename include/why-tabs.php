<?php 
  $page = $_SERVER["PHP_SELF"];
?>
    <div class="blurb">
        <ul id="what-tabs" class="tabs">
            <li class="title">
                Why Us:
            </li>
            <li
                <?php if($page=='/technology-stack.php') echo "class='active'"; ?> 
            >
                <a href="technology-stack">Technology</a>
            </li>
            <li
                <?php if($page=='/speed-vs-scale.php') echo "class='active'"; ?> 
            >
                <a href="speed-vs-scale">Speed and Scale</a>
            </li>
        </ul>
        <div style="clear: both;"></div>
    </div>

