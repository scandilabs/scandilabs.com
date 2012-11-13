<?php 
  $page = $_SERVER["PHP_SELF"];
?>

    	<div id="how-crumbs">
        	    
            <ul class="breadcrumb">
                <li>
                    <a href="how"
                    >
                        Idea
                    </a>
                </li>       
                <li
                    <?php if($page=='/strategy.php') echo "class='breadcrumb-current'"; ?>
                >                    
                    <a href="strategy">
                        Strategy
                    </a>
                </li>       
                <li
                    <?php if($page=='/concept.php') echo "class='breadcrumb-current'"; ?>
                >                    
                    <a href="concept">
                        Concept
                    </a>
                </li>       
                <li
                    <?php if($page=='/development.php') echo "class='breadcrumb-current'"; ?>
                >                    
                    <a href="development">
                        Development
                    </a>
                </li>       
                <li
                    <?php if($page=='/quality.php') echo "class='breadcrumb-current'"; ?>
                >                    
                    <a href="quality">
                        Quality
                    </a>
                </li>       
                <li
                    <?php if($page=='/maintenance.php') echo "class='breadcrumb-current'"; ?>
                >                    
                    <a href="maintenance">
                        Maintenance
                    </a>
                </li>       
            </ul>

    	</div>