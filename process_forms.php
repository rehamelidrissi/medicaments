<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "medfinder";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['from']) && $_POST['from'] == 'client') {
        // Handle form from dashboard-client.php
        $productNameModal = $conn->real_escape_string($_POST['productNameModal']);
        // Assuming id_medicament is being derived from productNameModal
        $id_medicament = getIdMedicament($productNameModal, $conn);

        $sql = "INSERT INTO recherche (id_medicament, date_recherche, heure_recherche, quantite_recherche)
                VALUES ('$id_medicament', CURDATE(), CURTIME(), 1)"; // Assuming quantity 1 for simplicity

        if ($conn->query($sql) === TRUE) {
            echo "New search record created successfully";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }

    } elseif (isset($_POST['from']) && $_POST['from'] == 'pharmacie') {
        // Handle form from dashboard-pharmacie.php
        $productNameModal = $conn->real_escape_string($_POST['productNameModal']);
        // Assuming id_medicament is being derived from productNameModal
        $id_medicament = getIdMedicament($productNameModal, $conn);

        $sql = "INSERT INTO proposer (id_pharmacie, id_medicament, quantite_disponible)
                VALUES (1, '$id_medicament', 10)"; // Assuming pharmacie ID 1 and quantity 10 for simplicity

        if ($conn->query($sql) === TRUE) {
            echo "New offer record created successfully";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
}

function getIdMedicament($productName, $conn) {
    // Assuming there's a table for medicaments where we can look up the ID
    $sql = "SELECT id_medicament FROM medicament WHERE nom = '$productName'";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        return $row['id_medicament'];
    } else {
        // Insert new medicament if not exists
        $sql = "INSERT INTO medicament (nom) VALUES ('$productName')";
        if ($conn->query($sql) === TRUE) {
            return $conn->insert_id;
        } else {
            die("Error: " . $sql . "<br>" . $conn->error);
        }
    }
}

$conn->close();
?>
