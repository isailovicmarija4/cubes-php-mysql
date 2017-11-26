<?php

session_start();

require_once __DIR__ . '/models/m_sale.php';


$page = 1;
if (isset($_GET['page'])) {
    $page = (int) $_GET['page'];
}


$rowsPerPages = 2;
$totalRows = saleProductsGetCount();
$totalPages = ceil($totalRows / $rowsPerPages);



$saleProducts = saleProductsFetchAllByPage($page, $rowsPerPages);



require_once __DIR__ . '/views/layout/header.php';
require_once __DIR__ . '/views/templates/t_sale.php';
require_once __DIR__ . '/views/layout/footer.php';
