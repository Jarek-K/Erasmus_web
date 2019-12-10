<?php
include_once "./Common.php";


$user = mysqli_fetch_assoc(QueryDatabase("SELECT id from users where email = '" . $_POST['email'] . "'"));

if (isset($user['id'])) {
    echo "F";
} else {
    if (password_verify($_POST["password"], $user['password'])) {
        session_start();
        $token = random_int(1000, 9999) . random_int(1000, 9999) . random_int(1000, 9999) . random_int(1000, 9999) . "TOK";
        QueryDatabase("INSERT into users ('name','email','password','age','gender','role') values  ");


        QueryDatabase("DELETE from token where user = " . $user['id']);
        QueryDatabase("INSERT into token ('token','user') values '$token', " . $user['id']);
        $_SESSION["token"] = $token;
        header('Location: ' . __DIR__ . "/RacesList.php");
    }
}
