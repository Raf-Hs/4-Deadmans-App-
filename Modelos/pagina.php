<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");

$usu= $_POST["usu"];
$pass= $_POST["pass"];

if (!isset($_POST["apikey"])) {
http_response_code(401);
die("Falta la Api Key");
} else {
if ('123' != $_POST["apikey"]) {
http_response_code(403);
die("Api Key incorrecta");
}
}

$servername = "dtai.uteq.edu.mx";
$database = "bd_awos_rafher207";
$username = "rafher207";
$password = "2022171029";

$conn = mysqli_connect($servername, $username, $password, $database);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$sql="SELECT * from usuarios where email like '$usu' and clave like '$pass'";
$result=$conn->query($sql);

while ($row = $result->fetch_assoc()) {
$myArray[] = $row;
}
echo json_encode($myArray);



?>