<?php 
  $page = $_SERVER["PHP_SELF"];
?>
    <div class="blurb">
        <ul id="what-tabs" class="tabs">
            <li class="title">
                <?php if($page=='/what.php'): ?>
                    What We Do
                <?php else: ?>
                    <a href="what">What We Do</a>
                <?php endif; ?>                    
            </li>
            <li
                <?php if($page=='/consumer-web.php') echo "class='active'"; ?> 
            >
                <a href="consumer-web">Web and Mobile</a>
            </li>
            <li
                <?php if($page=='/enterprise.php') echo "class='active'"; ?> 
            >
                <a href="enterprise">Business</a>
            </li>
            <li
                <?php if($page=='/it-consulting.php') echo "class='active'"; ?> 
            >
                <a href="it-consulting">IT Consulting</a>
            </li>
            <li
                <?php if($page=='/managed.php') echo "class='active'"; ?> 
            >
                <a href="managed">Hosting</a>
            </li>
        </ul>
        <div style="clear: both;"></div>
    </div>

