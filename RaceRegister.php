<?php
include_once  "./Common.php";

$uerId = VerifyToken($_SESSION['token']);



if (QueryDatabase("SELECT * from race_signup where race_id = " . $_POST['raceId'] . " and user_id = " . $userId))
    QueryDatabase("INSERT into race_signup ('race_id','user_id') values " . $_POST['raceId'] . "," . $userId);

header('Location: '.__DIR__."/RacesList.php");
