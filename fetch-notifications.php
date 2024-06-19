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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notifications</title>
</head>
<body>
    <h1>Notifications</h1>
    <div id="notifications"></div>

    <script>
        function fetchNotifications() {
            fetch('/get_notifications.php')
                .then(response => response.json())
                .then(data => {
                    const notificationsDiv = document.getElementById('notifications');
                    notificationsDiv.innerHTML = '';
                    data.notifications.forEach(notification => {
                        const p = document.createElement('p');
                        p.textContent = notification.message;
                        notificationsDiv.appendChild(p);
                    });
                });
        }

        // استدعاء الدالة بشكل دوري
        setInterval(fetchNotifications, 5000); // كل 5 ثواني
    </script>
</body>
</html>