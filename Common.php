<?php

function QueryDatabase($query)
{
    static $database = null;
    if ($database === null) {
        $database = mysqli_connect("localhost", "root", "", "erasmus");

        if ($database === false) {
            echo json_encode(array("ERROR_CODE" => "0003", "info" => mysqli_connect_error()));
            //my_log('database '."ERROR_CODE 0003", 2, __FILE__, __LINE__);
            exit;
        }
	mysqli_set_charset($database, "utf8");
    }

    $result = mysqli_query($database, $query);
    if ($result != false) {
        return $result;
    } else {
        //my_log('database '."ERROR_CODE 0000", 2, __FILE__, __LINE__);
        echo json_encode(array("ERROR_CODE" => "0000"));
        #exception wrong querry
        exit;
    }
}

function VerifyToken($token, $update = true)
{
    $token = preg_replace('/\s+/', '', $token);
    $tokenInfo = QueryDatabase("SELECT user, token, TIMESTAMPDIFF(MINUTE, last_used, now()) as'timeDif' FROM token where token = '$token'");
    //checking if authentication token is ok
    if ($tokenInfo->num_rows == 1) {
        $tokenInfo = mysqli_fetch_row($tokenInfo);
        //check if user was recently active, otherwise logout, in this case 120min
        if ($tokenInfo[2] < 120) {
            //update last active time
            if ($update) {
                QueryDatabase("UPDATE tokens SET Last_active_time = now() where  token = '$token'");

                return $tokenInfo[0];
            }
        } else {
            //old token, logout
            require_once './../authentication/logout.php';
            echo json_encode(array("ERROR_CODE" => "0002"));
            //my_log('verifyToken ' . "TIMEOUT user logged out", 0, __FILE__, __LINE__);
            exit;
        }
    } else {
        //nonexistent token
        echo json_encode(array("ERROR_CODE" => "0001"));
        //my_log('verifyToken ' . "ERROR_CODE 0001", 2, __FILE__, __LINE__);
        exit;
    }
}
