<?php
header('Content-type: application/json');
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Headers: *');


include 'dbConnector.php';
$db = new DbConnector;
$conn = $db->Connect();
//var_dump($conn);

//$user = file_get_contents('php://input');

echo json_encode("XDDD");