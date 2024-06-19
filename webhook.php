<?php

header('Content-Type: application/json');


$con = new mysqli("localhost", "root", "", "medfinder");


if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}


$data = json_decode(file_get_contents('php://input'), true);

// التحقق من وجود البيانات الضرورية
if (isset($data['medication_name']) && isset($data['pharmacy_name']) && isset($data['requested_quantity'])) {
    $medication_name = $con->real_escape_string($data['medication_name']);
    $pharmacy_name = $con->real_escape_string($data['pharmacy_name']);
    $requested_quantity = $con->real_escape_string($data['requested_quantity']);

   
    $sql = "INSERT INTO notifications (medication_name, pharmacy_name, requested_quantity) VALUES ('$medication_name', '$pharmacy_name', '$requested_quantity')";
    
    if ($con->query($sql) === TRUE) {
        echo json_encode(['status' => 'success', 'message' => 'Notification stored successfully']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Error storing notification']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid data received']);
}


$con->close();
?>