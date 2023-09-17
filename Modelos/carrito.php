<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");



$method = $_SERVER ['REQUEST_METHOD'];

$ipaddress = getenv ("REMOTE_ADDR");


if (!isset($_REQUEST["apikey"])) 
{
	http_response_code(401);
	die("Falta la Api Key");
} 
else 
{
	if ($_REQUEST["apikey"]=="123") 
	{

		$servername = "dtai.uteq.edu.mx";
		$database = "bd_awos_rafher207";
		$username = "rafher207";
		$password = "2022171029";

		$conn = mysqli_connect($servername, $username, $password, $database);

		if (!$conn) 
		{
			die("Connection failed: " . mysqli_connect_error());
		}

		$sql="SELECT productos.id_producto, nombre, precio,imagen  FROM  detalle_venta AS  detalle_venta LEFT JOIN productos AS productos ON productos.id_producto=carrito.id_producto where id_cliente like '1';";
		$result=$conn->query($sql);

		
		while ($row = $result->fetch_assoc()) {
			$data[] = $row;
		}
 
                			
 
		//header("Content-Type: application/json");
		echo json_encode($data);
		
		
		
	}
	else
	{
		 $data = array ("Message" => "Api no reconocida, su Op sera baneada al 3 intento", "IP" => $ipaddress);
		header("Content-Type: application/json");
    		echo json_encode($data);
    		http_response_code(400); exit;
    
	}
}

?>
