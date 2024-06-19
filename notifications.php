<?php
header('Content-Type: application/json');

$con = new mysqli("localhost", "root", "", "medfinder");

if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}

$sql = "SELECT medication_name, pharmacy_name, requested_quantity FROM notifications ORDER BY created_at DESC";
$result = $con->query($sql);

$notifications = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $notifications[] = [
            'message' => "Medication: " . $row['medication_name'] . ", Pharmacy: " . $row['pharmacy_name'] . ", Requested Quantity: " . $row['requested_quantity']
        ];
    }
}

echo json_encode(['notifications' => $notifications]);

$con->close();
?>