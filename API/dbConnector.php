<?php
class DbConnector
{
    private $server = 'localhost';
    private $username = 'root';
    private $password = '';
    private $db_name = 'car_config';

    public function Connect() {
        try {
            $conn = new PDO('mysql:host='.$this->server.';dbname='.$this->db_name, $this->username, $this->password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $conn;
        } catch (\Exception $e) {
            echo "Error ".$e->getMessage();
        }
    }
}
?>