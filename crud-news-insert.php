<?php

session_start();
require_once __DIR__ . '/models/m_users.php';
if (!isUserLoggedIn()) {
    header('Location: /login.php');
    die();
}
require_once __DIR__ . '/models/m_news.php';
require_once __DIR__ . '/models/m_sections.php';

//ovde se prihvataju vrednosti polja, popisati sve kljuceve i pocetne vrednosti
$formData = array(
    'section_id' => '',
    'title' => '',
    'description' => '',
    'content' => ''
);

//ovde se smestaju greske koje imaju polja u formi
$formErrors = array();


//uvek se prosledjuje jedno polje koje je indikator da su podaci poslati sa forme
//odnosno da je korisnik pokrenuo neku akciju
if (isset($_POST["task"]) && $_POST["task"] == "insert") {

    /*     * ********* filtriranje i validacija polja *************** */
    if (isset($_POST["section_id"]) && $_POST["section_id"] !== '') {

        $formData["section_id"] = $_POST["section_id"];


        $formData["section_id"] = trim($formData["section_id"]);
        $testGroup = sectionsFetchOneById($formData['section_id']);
        if (empty($testGroup)) {

            $formErrors["section_id"][] = "Izabrali ste neodgovarajucu vrednost za polje section_id";
        }
    } else {
        $formErrors["section_id"][] = "Polje section_id je obavezno";
    }


    if (isset($_POST["title"]) && $_POST["title"] !== '') {

        $formData["title"] = $_POST["title"];


        $formData["title"] = trim($formData["title"]);
    } else {
        $formErrors["title"][] = "Polje title je obavezno";
    }


    if (isset($_POST["description"]) && $_POST["description"] !== '') {

        $formData["description"] = $_POST["description"];


        $formData["description"] = trim($formData["description"]);
    }


    if (isset($_POST["content"]) && $_POST["content"] !== '') {

        $formData["content"] = $_POST["content"];


        $formData["content"] = trim($formData["content"]);
    } else {
        $formErrors["content"][] = "Polje content je obavezno";
    }


    if (isset($_FILES["photo"]) && empty($_FILES["photo"]['error'])) {
        //Filtering
        $photoFileTmpPath = $_FILES["photo"]["tmp_name"];
        $photoFileName = basename($_FILES["photo"]["name"]);
        $photoFileMime = mime_content_type($_FILES["photo"]["tmp_name"]);
        $photoFileSize = $_FILES["photo"]["size"];

        //validation
        $photoFileAllowedMime = array("image/jpeg", "image/png", "image/gif");
        $photoFileMaxSize = 5 * 1024 * 1024; // 1 MB

        if (!in_array($photoFileMime, $photoFileAllowedMime)) {
            $formErrors["photo"][] = "Fajl photo je u neispravnom formatu";
        }

        if ($photoFileSize > $photoFileMaxSize) {
            $formErrors["photo"][] = "Fajl photo prelazi maksimalnu dozvoljenu velicinu";
        }
    }




    /*     * ********* filtriranje i validacija polja *************** */


    //Ukoliko nema gresaka 
    if (empty($formErrors)) {
        $newNewsId = newsInsertOne($formData);
        $newNewsPhotoFileName = $newNewsId . '_' . $photoFileName;
        $destinationPath = __DIR__ . '/uploads/news/' . $newNewsPhotoFileName;


        if (move_uploaded_file($photoFileTmpPath, $destinationPath)) {
            newsUpdatePhotoFileName($newNewsId, $newNewsPhotoFileName);
 $_SESSION['system_message']="Uspesno ste dodali novu vest";

            header('Location: /crud-news-list.php');
            die();
        } else {
            $formErrors["photo"][] = "Doslo je do greske prilikom snimanja fajla photo";
        }
    }
}

$sectionList = sectionsGetList();

require_once __DIR__ . '/views/layout/header.php';
require_once __DIR__ . '/views/templates/t_crud-news-insert.php';
require_once __DIR__ . '/views/layout/footer.php';
