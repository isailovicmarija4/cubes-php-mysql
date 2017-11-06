<?php

//povlacenje jednog reda iz tabele


$link = mysqli_connect('127.0.0.1','cubes','cubes','cubesphp');
if($link === false){
    die('MYSQL ERROR :' . mysqli_connect_error());
}
$id=21;
//na osnovu promenljive povuci proizvod iz baze

$query="SELECT * FROM products WHERE id= '". mysqli_real_escape_string($link,$id) . "'";

$result=mysqli_query($link,$query);
if($result===false){
    die("MySql error" . mysqli_error($link));
}

//dva nacina:
//1:
//$products= mysqli_fetch_all($result,MYSQLI_ASSOC);
//
//$product= $products[0];
//print_r($product);
//2:

$product= mysqli_fetch_assoc($result);
print_r($product);