<?php
header('Content-Type: application/json');
$response = array('success' => false);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nom = $_POST['nom'];
    $prix = $_POST['prix'];
    $quantite_disponible = $_POST['quantite_disponible'];

    $con = mysqli_connect('localhost', 'root', '', 'medfinder');
    if (!$con) {
        die("Connection failed: " . mysqli_connect_error());
    }

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

        // Check if medicament already exists in proposer table
        $sql_check_proposer = "SELECT * FROM proposer WHERE id_medicament = '$id_medicament'";
        $result_proposer = mysqli_query($con, $sql_check_proposer);

        if (mysqli_num_rows($result_proposer) > 0) {
            // Medicament exists in proposer table, update the quantity
            $row_proposer = mysqli_fetch_assoc($result_proposer);
            $new_quantity = $row_proposer['quantite_disponible'] + $quantite_disponible;
            $sql_update_quantity = "UPDATE proposer SET quantite_disponible = '$new_quantity' WHERE id_medicament = '$id_medicament'";
            if (!mysqli_query($con, $sql_update_quantity)) {
                throw new Exception('Error updating quantity in proposer');
            }
        } else {
            // Insert into proposer table
            $sql_proposer = "INSERT INTO proposer (id_medicament, quantite_disponible) VALUES ('$id_medicament', '$quantite_disponible')";
            if (!mysqli_query($con, $sql_proposer)) {
                throw new Exception('Error inserting into proposer');
            }
        }

        // Check and update recherche table
        $sql_recherche = "SELECT * FROM recherche WHERE id_medicament = '$id_medicament' AND quantite_recherche <= '$quantite_disponible' AND satisfait = 0";
        $result_recherche = mysqli_query($con, $sql_recherche);

        if (mysqli_num_rows($result_recherche) > 0) {
            $row_recherche = mysqli_fetch_assoc($result_recherche);
            $id_recherche = $row_recherche['id_recherche'];

            // Update recherche table
            $sql_update_recherche = "UPDATE recherche SET satisfait = 1 WHERE id_recherche = '$id_recherche'";
            if (mysqli_query($con, $sql_update_recherche)) {
                mysqli_commit($con);
                $response['success'] = true;
            } else {
                throw new Exception('Error updating recherche');
            }
        } else {
            mysqli_commit($con);
            $response['success'] = true;
        }
    } catch (Exception $e) {
        mysqli_rollback($con);
        error_log("Exception: " . $e->getMessage());
        $response['message'] = 'Transaction failed';
    }

    mysqli_close($con);
}

echo json_encode($response);
?>
