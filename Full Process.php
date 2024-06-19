<?php
function submitApplication($patientId, $medicamentId, $quantity) {
    // Connexion à la base de données
    $conn = new mysqli("localhost", "username", "password", "database");

    // Vérifier la connexion
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Insérer la demande dans la base de données
    $sql = "INSERT INTO reservation (id_medicament, date_reservation, statut, quantite_reservation) VALUES (?, CURDATE(), 'pending', ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $medicamentId, $quantity);
    $stmt->execute();
    $stmt->close();

    // Vérifier si le médicament est disponible dans une pharmacie
    if (checkDrugAvailability($medicamentId)) {
        // Obtenir l'email du patient
        $sql = "SELECT email FROM patient WHERE id_patient = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $patientId);
        $stmt->execute();
        $result = $stmt->get_result();
        $patient = $result->fetch_assoc();
        $patientEmail = $patient['email'];
        $stmt->close();

        // Obtenir le nom du médicament
        $sql = "SELECT nom FROM medicament WHERE id_medicament = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $medicamentId);
        $stmt->execute();
        $result = $stmt->get_result();
        $medicament = $result->fetch_assoc();
        $medicamentName = $medicament['nom'];
        $stmt->close();

        // Notifier le patient
        notifyPatient($patientEmail, $medicamentName);
    }

    $conn->close();
}

// Exemple d'utilisation
submitApplication(1, 1, 10);
?>

