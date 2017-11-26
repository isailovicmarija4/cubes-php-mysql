<?php
session_start();

require_once __DIR__ . '/models/m_sale.php';
$newProductsOnSale= saleProductsFetchAll();

require_once __DIR__ . '/views/layout/header.php';
require_once __DIR__ . '/views/templates/t_index.php';
require_once __DIR__ . '/views/layout/footer.php';
