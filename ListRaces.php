<?php
include_once "./Common.php";
echo "<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js' integrity='sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1' crossorigin='anonymous'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js' integrity='sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM' crossorigin='anonymous'></script>

<body style='background-color:#343a40;'>

<table class='table table-borderless table-dark'>

    <thead>
      <tr>
        <th scope='col'>Name</th>
        <th scope='col'>Date</th>
        
        <th scope='col'>Status</th>
        <th scope='col'>Localization</th>
        <th scope='col'>Details</th>
        <th scope='col'>Race Signup</th>

      </tr>
    </thead>
    <tbody>";
    $races = mysqli_fetch_all(QueryDatabase ("SELECT * from races where status IN ('OPEN','FULL') "),MYSQLI_ASSOC); // array(array("localizations"=>"Madrid","status"=>"OPEN"),array("localizations"=>"Paris","status"=>"OPEN"));

   
    foreach ($races as $key => $value) {
        echo "<tr>";
        echo " <td>".$value["name"]."</td>";
        echo " <td>".$value["race_date"]."</td>";
        echo " <td>".$value["status"]."</td>";

        echo " <td>".$value["localization"]."</td>";
        echo " <td>det</td>";
        echo " <td>det</td>";

        echo"</tr>";

    }

    echo "  </tbody>
    </table>
    </body>";

?>

