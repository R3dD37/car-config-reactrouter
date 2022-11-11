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
        $query = "SELECT * FROM cars WHERE id = $idCar;";
        $stms = $conn->prepare($query);
        $stms->execute();
        $oneCar = $stms->fetch(PDO::FETCH_ASSOC);
        echo json_encode($oneCar);
    }
    else
    {
        $query = "SELECT * FROM default_car;";
        $stms = $conn->prepare($query);
        $stms->execute();
        $cars = $stms->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($cars);
    }   
}