<?php

session_start();
require_once __DIR__ . '/models/m_products.php';
require_once __DIR__ . '/models/m_brands.php';



if (!isset($_GET['id'])) {
    die('Morate prosledi id od brenda');
}
$id = (int) $_GET['id'];
$brand = brandsFetchOneById($id);
if (empty($brand)) {
    die('izabrani brend ne postoji');
}
$page = 1;
if (isset($_GET['page'])) {
    $page = (int) $_GET['page'];
}


$rowsPerPages = 4;
$totalRows = productsGetCountByBrand($brand['id']);
$totalPages = ceil($totalRows / $rowsPerPages);



$products = productsFetchAllByBrandByPage($brand['id'], $page, $rowsPerPages);










require_once __DIR__ . '/views/layout/header.php';
require_once __DIR__ . '/views/templates/t_brand.php';
require_once __DIR__ . '/views/layout/footer.php';
