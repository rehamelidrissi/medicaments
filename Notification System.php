<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "pharmacy"; // Remplacez par le nom de votre base de données

// Créer une connexion
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifier la connexion
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

function notifyPatient($patientEmail, $drugName) {
    $subject = "Drug Availability Notification";
    $message = "Dear Patient,\n\nThe drug $drugName you applied for is now available at one of our pharmacies. Please visit our site to reserve the desired quantity.\n\nBest regards,\nPharmacy Team";
    $headers = "From: no-reply@pharmacy.com";

    mail($patientEmail, $subject, $message, $headers);
}

// Exemple de fonction pour vérifier la disponibilité des médicaments et notifier les patients
function checkDrugAvailabilityAndNotify($conn) {
    // Requête pour obtenir les informations sur les médicaments et les pharmacies qui les proposent
    $sql = "
        SELECT r.id_recherche, r.id_medicament, r.quantite_recherche, p.email AS patient_email, m.nom AS drug_name
        FROM recherche r
        JOIN medicament m ON r.id_medicament = m.id_medicament
        JOIN proposer pr ON m.id_medicament = pr.id_medicament
        JOIN pharmacie ph ON pr.id_pharmacie = ph.id_pharmacie
        JOIN patient p ON r.id_recherche = p.id_patient
        WHERE r.satisfait = 0 AND pr.quantite_disponible >= r.quantite_recherche";

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Traiter chaque ligne de résultat
        while($row = $result->fetch_assoc()) {
            // Envoyer la notification au patient
            notifyPatient($row['patient_email'], $row['drug_name']);
            
            // Mettre à jour le statut de satisfaction de la recherche
            $updateSql = "UPDATE recherche SET satisfait = 1 WHERE id_recherche = " . $row['id_recherche'];
            $conn->query($updateSql);
        }
    } else {
        echo "No drugs available that match the search criteria.";
    }
}

// Appel de la fonction pour vérifier et notifier
checkDrugAvailabilityAndNotify($conn);

// Fermer la connexion
$conn->close();
?>
