<?php   

function get_average($a) {
    // Write your code here
    return floor(array_sum($a)/count($a));
  }

echo get_average([2, 2, 2, 2]);
?>
