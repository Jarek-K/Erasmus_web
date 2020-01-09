<?php
include_once "./Common.php";

$uerId = VerifyToken($_SESSION['token']);



if (QueryDatabase("SELECT * from race_signup where race_id = " . $_POST['raceId'] . " and user_id = " . $userId))
    QueryDatabase("DELETE from  race_signup where race_id = " . $_POST['raceId'] . " and user_id = " . $userId);

header ('Location: '.__DIR__."/RacesList.php");

