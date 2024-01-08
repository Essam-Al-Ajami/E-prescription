<?php
session_start();
if(isset($_SESSION['user'])){
    if($_SESSION['user']->ROLE==="USER"){
        echo 'welcome ' .$_SESSION['user']->NAME;
        $username = "root";
$password = "";
$database = new PDO("mysql:host=localhost; dbname=e-perscription;",$username,$password);
$addData = $database->prepare("INSERT INTO Medicine(Medicine_Name ,Medicine_Price , Medicine_Dosage , Medicine_Type , Medicine_Quanity ) VALUES(//القيم من الواجهات)");

    }
}
?>