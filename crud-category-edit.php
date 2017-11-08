<?php
session_start();
require_once __DIR__ . '/models/m_categories.php';


require_once __DIR__ . '/views/layout/header.php';
require_once __DIR__ . '/views/templates/t_crud-category-edit.php';
require_once __DIR__ . '/views/layout/footer.php';
