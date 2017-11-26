<?php
session_start();

require_once __DIR__ . '/models/m_users.php';

if (!isUserLoggedIn()) {
	header('Location: /login.php');
	die();
}
$systemMessage = '';
if(isset($_SESSION['system_message'])){
    $systemMessage=$_SESSION['system_message'];
    unset($_SESSION['system_message']);
    
    
}
$userProfile=usersFetchOneById($_SESSION['logged_in_user']['id']);

require_once __DIR__ . '/views/layout/header.php';
require_once __DIR__ . '/views/templates/t_profile-preview.php';
require_once __DIR__ . '/views/layout/footer.php';
