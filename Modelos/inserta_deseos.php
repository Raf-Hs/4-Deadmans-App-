<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");

$servername = "dtai.uteq.edu.mx";
                $dbname = "bd_awos_rafher207";
                $username = "rafher207";
                $password = "2022171029";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


if(!$_REQUEST['id_producto'])
{
die('Manda tu producto');	
}

$sql = "INSERT INTO deseos VALUES ( 1, " . $_REQUEST["id_producto"] . " )";

if ($conn->query($sql) === TRUE) {
  echo "New record in deseos";
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
