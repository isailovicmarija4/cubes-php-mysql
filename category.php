<?php
session_start();
require_once __DIR__ . '/models/m_products.php';
require_once __DIR__ . '/models/m_categories.php';



if(!isset($_GET['id'])){
    die('Morate prosledii id od kategorije');
}
$id=(int)$_GET['id'];
$category= categoriesFetchOneById($id);
if(empty($category)){
    die('izabrana kategorija ne postoji');
}
$page=1;
if(isset($_GET['page'])){
    $page=(int) $_GET['page'];
    
}


$rowsPerPages=8;
$totalRows= productsGetCountByCategory($category['id']);
$totalPages=ceil($totalRows/$rowsPerPages);



$products= productsFetchAllByCategoryByPage($category['id'],$page,$rowsPerPages);










require_once __DIR__ . '/views/layout/header.php';
require_once __DIR__ . '/views/templates/t_category.php';
require_once __DIR__ . '/views/layout/footer.php';