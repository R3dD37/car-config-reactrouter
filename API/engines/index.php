<?php
header('Content-type: application/json');
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Headers: *');
include '../dbConnector.php';

$db = new DbConnector;
$conn = $db->Connect();


$method = $_SERVER['REQUEST_METHOD'];

if ($method == 'GET') {
    $path = explode('/', $_SERVER['REQUEST_URI']);
    if (isset($path[5]) && is_numeric($path[5]))
    {
        $idCar = $path[5];
        $query = "SELECT * FROM drive_select_list WHERE id_car = $idCar;";
        $stms = $conn->prepare($query);
        $stms->execute();
        $engines = $stms->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($engines);
    }
}