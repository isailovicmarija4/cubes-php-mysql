<?php
session_start();
require_once __DIR__ . '/models/m_users.php';

if (!isUserLoggedIn()) {
	header('Location: /login.php');
	die();
}

$userProfile = usersFetchOneById($_SESSION['logged_in_user']['id']);

//ovde se prihvataju vrednosti polja, popisati sve kljuceve i pocetne vrednosti
$formData = array(
    'email'=>$userProfile['email'],
    'first_name'=>$userProfile['first_name'],
       'last_name'=>$userProfile['last_name']

	//ovde napisati sve kljuceve i pocetne vrednosti
);

//ovde se smestaju greske koje imaju polja u formi
$formErrors = array();


//uvek se prosledjuje jedno polje koje je indikator da su podaci poslati sa forme
//odnosno da je korisnik pokrenuo neku akciju
if (isset($_POST["task"]) && $_POST["task"] == "save") {
	
	/*********** filtriranje i validacija polja ****************/
	

	if (isset($_POST["email"]) && $_POST["email"] !== '') {
		//Dodavanje parametara medju podatke u formi
		$formData["email"] = $_POST["email"];
		
	
		$formData["email"] = trim($formData["email"]);
		
	} 
    
	if (isset($_POST["first_name"]) && $_POST["first_name"] !== '') {
		//Dodavanje parametara medju podatke u formi
		$formData["first_name"] = $_POST["first_name"];
		
		//Filtering 1
		$formData["first_name"] = trim($formData["first_name"]);
		//Filtering 2
		//Filtering 3
		//Filtering 4
		//...
		
		//Validation 2
		//Validation 3
		//Validation 4
		//...
		
	}
       

	if (isset($_POST["last_name"]) && $_POST["last_name"] !== '') {
		//Dodavanje parametara medju podatke u formi
		$formData["last_name"] = $_POST["last_name"];
		
		//Filtering 1
		$formData["last_name"] = trim($formData["last_name"]);
		//Filtering 2
		//Filtering 3
		//Filtering 4
		//...
		
		//Validation 2
		//Validation 3
		//Validation 4
		//...
		
	} 
	/*********** filtriranje i validacija polja ****************/
	
	
	//Ukoliko nema gresaka 
	if (empty($formErrors)) {
		//Uradi akciju koju je korisnik trazio
            usersUpdateOneById($userProfile['id'], $formData);
                
                $_SESSION['system_message']="Uspesno ste izmenili korisnika";
                
                
		header('Location: /profile-preview.php');
		
		die();
            
            
     
	}
}





require_once __DIR__ . '/views/layout/header.php';
require_once __DIR__ . '/views/templates/t_profile-edit.php';
require_once __DIR__ . '/views/layout/footer.php';
