<?php

class StatusCodeController {
    public function ReturnStatusCode($error, $code, $message) {
        $response = array();
        $response["error"] = $error;
        $response["code"] = $code;
        $response["message"] = $message;
        echo json_encode($response, JSON_PRETTY_PRINT);
    }
}