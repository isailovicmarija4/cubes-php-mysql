<?php
//ubacivanje u tabelu groups novu grupu

$link = mysqli_connect('127.0.0.1','cubes','cubes','cubesphp');
if($link === false){
    die('MYSQL ERROR :' . mysqli_connect_error());
}
$title='Group title';
$query="INSERT INTO groups ( `title`) VALUES ('" . mysqli_real_escape_string($link,$title) . "')";

$result= mysqli_query($link, $query);
        
if($result===false){
     die("MySql error" . mysqli_error($link));   
    
}
//odmah nakon mysqli_query,mora
$newId= mysqli_insert_id($link);
echo "new group has been added with id" . $newId;


    

