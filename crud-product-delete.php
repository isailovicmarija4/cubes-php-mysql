<?php
session_start();
require_once __DIR__ . '/models/m_users.php';
if(!isUserLoggedIn()){
    header('Location: /login.php');
	die();
}
require_once __DIR__ . '/models/m_products.php';

if (empty($_GET['id'])) {
	die('Morate proslediti id');
}

$id = (int) $_GET['id'];

$product = productsFetchOneById($id);

if (empty($product)) {
	die('Izabrali ste nepostojec proizvod');
}
if (isset($_POST["task"]) && $_POST["task"] == "delete") {
	$photoFilePath=__DIR__ . '/uploads/products/' . $product['photo_file_name'];
        if(file_exists($photoFilePath)){
            unlink($photoFilePath);
        }
	productsDeleteOneById($product['id']);
  $_SESSION['system_message']="Uspesno ste izbrisali proizvod";
	header('Location: /crud-product-list.php');
	die();
}



require_once __DIR__ . '/views/layout/header.php';
require_once __DIR__ . '/views/templates/t_crud-product-delete.php';
require_once __DIR__ . '/views/layout/footer.php';
