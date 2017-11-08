<?php
session_start(); 

require_once __DIR__ . '/models/m_brands.php';
if(empty($_GET['id'])){
    die("Prosledi id");
}
$id=(int) $_GET['id'];

//$link = mysqli_connect('127.0.0.1','cubes','cubes','cubesphp');
//
//if($link === false){
//    die('MYSQL ERROR :' . mysqli_connect_error());
//}

$brand= brandsFetchOneById($id);

//$result = mysqli_query($link, $query);
//
//
//if($result===false){ 
//    die('MYSQL ERROR :' . mysqli_error($link));
//    
//}



 if(empty($brand)){
     die('Trazeni brend ne postoji');
 }
if (isset($_POST["task"]) && $_POST["task"] == "delete") {
//    $query="DELETE FROM brands WHERE id='" . mysqli_real_escape_string($link,$brand['id']) .  "'";
//    
//    $result = mysqli_query($link, $query);
//		if ($result === false) {
//			die('MySQL error: ' . mysqli_error($link));
//		}
    brandsDeleteOneById($id);
		header('Location: /crud-brand-list.php');
		die();
    
}
require_once __DIR__ .'/views/layout/header.php';
require_once __DIR__ .'/views/templates/t_crud-brand-delete.php';
require_once __DIR__ .'/views/layout/footer.php';