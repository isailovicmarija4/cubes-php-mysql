<?php

session_start();
require_once __DIR__ . '/models/m_news.php';
require_once __DIR__ . '/models/m_sections.php';



if (!isset($_GET['id'])) {
    die('Morate prosledii id od sekcije');
}
$id = (int) $_GET['id'];
$section = sectionsFetchOneById($id);
if (empty($section)) {
    die('izabrana sekcije ne postoji');
}
$page = 1;
if (isset($_GET['page'])) {
    $page = (int) $_GET['page'];
}


$rowsPerPages = 2;
$totalRows = newsGetCountByCategory($section['id']);
$totalPages = ceil($totalRows / $rowsPerPages);



$news = newsFetchAllByCategoryByPage($section['id'], $page, $rowsPerPages);










require_once __DIR__ . '/views/layout/header.php';
require_once __DIR__ . '/views/templates/t_news-section.php';
require_once __DIR__ . '/views/layout/footer.php';
