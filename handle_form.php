<?php
header('Content-Type: application/json');

// Database connection
$con = new mysqli("localhost", "root", "", "medfinder");

// Check connection
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'];

    if ($action === 'addOrder') {
        $productName = $_POST['productNameModal'];

        // Insert into recherche table
        $stmt = $con->prepare("INSERT INTO recherche (productName) VALUES (?)");
        $stmt->bind_param("s", $productName);
        $stmt->execute();
        $stmt->close();
        
        echo json_encode(['success' => true, 'message' => 'Order added successfully']);
        
    } elseif ($action === 'addOffer') {
        $productName = $_POST['productNameModal'];
        $idRecherche = $_POST['idRecherche'];

        // Insert into proposer table
        $stmt = $con->prepare("INSERT INTO proposer (productName, id_recherche) VALUES (?, ?)");
        $stmt->bind_param("si", $productName, $idRecherche);
        $stmt->execute();
        $idProposer = $stmt->insert_id;
        $stmt->close();

        // Check if there's a matching reservation
        $stmt = $con->prepare("SELECT id_reservation FROM reservation WHERE id_proposer = ?");
        $stmt->bind_param("i", $idProposer);
        $stmt->execute();
        $result = $stmt->get_result();
        $hasReservation = $result->num_rows > 0;
        $stmt->close();

        echo json_encode(['success' => true, 'message' => 'Offer added successfully', 'hasReservation' => $hasReservation]);
    }
}

$con->close();
?>
