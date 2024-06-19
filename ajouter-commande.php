<?php
header('Content-Type: application/json');

// Connexion à la base de données
$con = mysqli_connect('localhost', 'root', '', 'medfinder');

if (!$con) {
    error_log("Connection failed: " . mysqli_connect_error());
    echo json_encode(['success' => false, 'message' => 'Database connection failed']);
    exit();
}

// Récupération des données du formulaire
$nom = mysqli_real_escape_string($con, $_POST['nom']);
$prix = floatval($_POST['prix']);
$quantite_reservee = intval($_POST['quantite_reservee']);

mysqli_begin_transaction($con);

try {
    // Check if medicament exists
    $sql_check_medicament = "SELECT * FROM medicament WHERE nom = '$nom'";
    $result = mysqli_query($con, $sql_check_medicament);

    if (mysqli_num_rows($result) > 0) {
        // Medicament exists, get id_medicament
        $row = mysqli_fetch_assoc($result);
        $id_medicament = $row['id_medicament'];
    } else {
        // Insert into medicament table
        $sql_medicament = "INSERT INTO medicament (nom, prix) VALUES ('$nom', '$prix')";
        if (mysqli_query($con, $sql_medicament)) {
            $id_medicament = mysqli_insert_id($con);
        } else {
            throw new Exception('Error inserting medicament');
        }
    }

    // Check available quantity in proposer table
    $sql_check_quantity = "SELECT quantite_disponible FROM proposer WHERE id_medicament = '$id_medicament'";
    $result_quantity = mysqli_query($con, $sql_check_quantity);
    if (mysqli_num_rows($result_quantity) > 0) {
        $row_quantity = mysqli_fetch_assoc($result_quantity);
        $quantite_disponible = $row_quantity['quantite_disponible'];

        if ($quantite_reservee <= $quantite_disponible) {
            // Update proposer table to decrease the quantity
            $new_quantity = $quantite_disponible - $quantite_reservee;
            $sql_update_quantity = "UPDATE proposer SET quantite_disponible = '$new_quantity' WHERE id_medicament = '$id_medicament'";
            if (!mysqli_query($con, $sql_update_quantity)) {
                throw new Exception('Error updating quantity in proposer');
            }

            // Insert into reservation table
            $sql_reservation = "INSERT INTO reservation (id_medicament, quantite_reservation) VALUES ('$id_medicament', '$quantite_reservee')";
            if (mysqli_query($con, $sql_reservation)) {
                mysqli_commit($con);
                echo json_encode(['success' => true]);
            } else {
                throw new Exception('Error inserting reservation');
            }
        } else {
            throw new Exception('Insufficient quantity available');
        }
    } else {
        throw new Exception('Medicament not available in proposer table');
    }
} catch (Exception $e) {
    mysqli_rollback($con);
    error_log("Exception: " . $e->getMessage());
    echo json_encode(['success' => false, 'message' => $e->getMessage()]);
}

mysqli_close($con);
?>
