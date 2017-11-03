<?php

//mysqli-fje koje pocinju sa mysqli_(proceduralno i objektno orjentisanu varijantu)
//PDO -OO bIblioteka


$link=mysqli_connect('127.0.0.1','cubes','cubes','cubesphp');
if($link===false){
    die('MYSQL ERROR :' . mysqli_connect_error());
}