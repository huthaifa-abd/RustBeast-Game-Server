<?php
abstract class AbstractController {
    public $connection;

    // auto constructor
    function __construct() {
        require 'include/dbconnect.php';
        // opening db connection
        $db = new dbconnect();
        $this->connection = $db->Connect();
    }

    // returns the date
    public function GetDate() {
        return date('d.m.Y - H:i:s');
    }

    public function ReturnStatusCode($error, $code, $message) {
        $status = new StatusCodeController();
        $status->ReturnStatusCode($error, $code, $message);
    }
}

?>