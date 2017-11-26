<?php

require_once __DIR__ . '/m_database.php';

/**
 * 
 * @return array Aarray of associative arrays that represent rows
 */
function saleProductsFetchAll() {
	$query = "SELECT `products`.* ,  "
                . "`categories`.`title` AS `category_title`, "
                . "`brands`.`title` AS `brand_title` "
                . "FROM `products`  "
                . "LEFT JOIN `categories` ON `products`.`category_id`=`categories`.`id`   "
                . "LEFT JOIN `brands` ON `products`.`brand_id`=`brands`.`id` "
                . "WHERE `products`.`on_sale`=1 "
                . "ORDER BY `products`.`created_at` DESC "
                . "LIMIT 4 ";
            
                
           
	
	
	return dbFetchAll($query);
}




	


/**
 * @return int Count of all rows in table
 */
function saleProductsGetCount() {
	$link = dbGetLink();
	
	$query = "SELECT COUNT(`id`) FROM `products`"
                . "WHERE `products`.`on_sale`=1";
	
	return dbFetchColumn($query);
}


function saleProductsFetchAllByPage($page, $rowsPerPages) {

    $query = "SELECT `products`.* ,  "
                . "`categories`.`title` AS `category_title`, "
                . "`brands`.`title` AS `brand_title` "
                . "FROM `products`  "
                . "LEFT JOIN `categories` ON `products`.`category_id`=`categories`.`id`   "
                . "LEFT JOIN `brands` ON `products`.`brand_id`=`brands`.`id`"
            . "WHERE `products`.`on_sale`=1";
    $limit=$rowsPerPages;
    $offset=($page-1) * $rowsPerPages;
    
         $query .="  LIMIT " . $limit . "  OFFSET  " . $offset; 
    
   return dbFetchAll($query);
}