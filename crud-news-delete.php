<?php

session_start();
require_once __DIR__ . '/models/m_users.php';
if (!isUserLoggedIn()) {
    header('Location: /login.php');
    die();
}
require_once __DIR__ . '/models/m_news.php';

if (empty($_GET['id'])) {
    die('Morate proslediti id');
}

$id = (int) $_GET['id'];

$new = newsFetchOneById($id);

if (empty($new)) {
    die('Izabrali ste nepostojecu kategoriju');
}
if (isset($_POST["task"]) && $_POST["task"] == "delete") {

    newsDeleteOneById($id);
$_SESSION['system_message']="Uspesno ste izbrisali vest";

    header('Location: /crud-news-list.php');
    die();
}

require_once __DIR__ . '/views/layout/header.php';
require_once __DIR__ . '/views/templates/t_crud-news-delete.php';
require_once __DIR__ . '/views/layout/footer.php';
