<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Patient Dashboard</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="style.css">
</head>

<body>
<div class="container mt-3">
  <h1 class="text-center mb-4">Patient Dashboard</h1>

  <style>
    .navbar {
        margin-bottom: 0 !important;
    }
    .navbar-brand {
        font-size: 1.8rem;
    }
    .navbar-nav > li {
        padding-left: 1rem;
        padding-right: 1rem;
    }
    .notifications-bar {
        background-color: #f8f9fa;
        padding: 1rem;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    .round {
        border-radius: 50%;
        background: red;
        padding: 0.3rem 0.6rem;
        position: relative;
        top: -10px;
        left: -10px;
        color: white;
        font-size: 0.8rem;
    }
    .fa-bell {
        position: relative;
    }
</style>

<!-- Navbar -->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Notifications System</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li>
                <i class="fa fa-bell" id="notifications-icon" style="font-size:32px;color:white;margin:0.5rem 0.4rem;"></i>
                <div class="round" id="bell-count" style="display:none;"><span id="notifications-count"></span></div>
            </li>
        </ul>
    </div>
</nav>

<!-- Notifications Bar -->
<div class="notifications-bar" id="notifications-bar" style="display:none;">
    <span><a href="notification.php"></a>You have new notifications</span>
    
    
</div>

<script>
    function fetchNotifications() {
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
    }

    </script>



  <div class="mb-4">
    <h2>Ajouter une commande</h2>
    <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addOrderModal">Ajouter une commande</button>
  </div>
  <div class="row">
    <div class="col-md-8">
      <h2>Historique de mes demandes</h2>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>Nom</th>
            <th>Prix</th>
            <th>Quantité réservée</th>
            <th>Opérations</th>
          </tr>
        </thead>
        <tbody>
          <?php
            // Connexion à la base de données
            $con = mysqli_connect('localhost', 'root', '', 'medfinder');
            if (!$con) {
                die("Connection failed: " . mysqli_connect_error());
            }

            $result = mysqli_query($con, "SELECT reservation.id_reservation, reservation.quantite_reservation, medicament.prix, medicament.nom 
                                          FROM medicament
                                          INNER JOIN reservation ON medicament.id_medicament = reservation.id_medicament");
            while ($row = mysqli_fetch_array($result)) {
                echo '<tr>
                        <td>'. $row['nom']. '</td>
                        <td>'. $row['prix']. '</td>
                        <td>'. $row['quantite_reservation']. '</td>
                        <td>
                          <button class="btn btn-primary edit-order" data-bs-toggle="modal" data-bs-target="#editOrderModal" 
                            data-id="'. $row['id_reservation']. '" data-name="'. $row['nom']. '" data-price="'. $row['prix']. '" 
                            data-quantity="'. $row['quantite_reservation']. '">Modifier</button>
                          <button class="btn btn-danger delete-order" data-id="'. $row['id_reservation']. '">Supprimer</button>
                        </td>
                      </tr>';
            }
          ?>
        </tbody>
      </table>
    </div>
  </div>
</div>
        
<!-- Modal Ajouter commande -->
<div class="modal fade" id="addOrderModal" tabindex="-1" aria-labelledby="addOrderModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addOrderModalLabel">Ajouter une commande</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="addOrderFormModal">
          <div class="form-group">
            <label for="productNameModal">Nom</label>
            <input type="text" class="form-control" id="productNameModal" name="productNameModal" required>
          </div>
          <div class="form-group">
            <label for="productPriceModal">Prix</label>
            <input type="number" class="form-control" id="productPriceModal" name="productPriceModal" required>
          </div>
          <div class="form-group">
            <label for="productQuantityModal">Quantité</label>
            <input type="number" class="form-control" id="productQuantityModal" name="productQuantityModal" required>
          </div>
          <button type="submit" class="btn btn-primary">Ajouter</button>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
      </div>
    </div>
  </div>
</div>

<script>
document.getElementById('addOrderFormModal').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent default form submission
    var form = event.target;
    var formData = new FormData(form);

    // Add the source of the form submission
    formData.append('from', 'client');

    fetch('process_forms.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(data => {
        console.log(data); // Handle success response
        // Optionally display a success message or perform additional actions
    })
    .catch(error => {
        console.error('Error:', error); // Handle error response
    });

    // Submit the form as usual after the AJAX call
    form.submit();
});
</script>

<!-- Modal Modifier commande -->
<div class="modal fade" id="editOrderModal" tabindex="-1" aria-labelledby="editOrderModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editOrderModalLabel">Modifier une commande</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="editOrderFormModal">
          <div class="form-group">
            <label for="editProductNameModal">Nom</label>
            <input type="text" class="form-control" id="editProductNameModal" name="editProductNameModal" required>
          </div>
          <div class="form-group">
            <label for="editProductPriceModal">Prix</label>
            <input type="number" class="form-control" id="editProductPriceModal" name="editProductPriceModal" required>
          </div>
          <div class="form-group">
            <label for="editProductQuantityModal">Quantité</label>
            <input type="number" class="form-control" id="editProductQuantityModal" name="editProductQuantityModal" required>
          </div>
          <input type="hidden" id="editProductIdModal" name="editProductIdModal">
          <button type="submit" class="btn btn-primary">Modifier</button>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
$(document).ready(function() {
  // Écoutez la soumission du formulaire d'ajout
  $("#addOrderFormModal").submit(function(event) {
    event.preventDefault(); // Prevent the form from submitting normally

    // Get form values
    var productName = $("#productNameModal").val();
    var productPrice = $("#productPriceModal").val();
    var productQuantity = $("#productQuantityModal").val();

    // Send data to the server via AJAX
    $.ajax({
      url: "ajouter-commande.php",
      method: "POST",
      dataType: "json",
      data: {
        nom: productName,
        prix: productPrice,
        quantite_reservee: productQuantity
      },
      success: function(data) {
        if (data.success) {
          alert("Commande ajoutée avec succès.");
          location.reload(); // Reload the page to show new data
        } else {
          alert("Erreur lors de l'ajout de la commande. Veuillez réessayer.");
        }
      },
      error: function(error) {
        console.error("Erreur lors de l'ajout de la commande:", error);
        alert("Erreur lors de l'ajout de la commande. Veuillez réessayer.");
      }
    });
  });

  // Charger les données dans le formulaire de modification
  $(".edit-order").click(function() {
    var id = $(this).data('id');
    var name = $(this).data('name');
    var price = $(this).data('price');
    var quantity = $(this).data('quantity');

    $("#editProductIdModal").val(id);
    $("#editProductNameModal").val(name);
    $("#editProductPriceModal").val(price);
    $("#editProductQuantityModal").val(quantity);

    // Affichez la modale de modification
    $('#editOrderModal').modal('show');
  });

  // Écoutez la soumission du formulaire de modification
  $("#editOrderFormModal").submit(function(event) {
    event.preventDefault(); // Empêche le formulaire d'être soumis normalement

    // Récupérez les valeurs des champs
    var id = $("#editProductIdModal").val();
    var name = $("#editProductNameModal").val();
    var price = $("#editProductPriceModal").val();
    var quantity = $("#editProductQuantityModal").val();

    // Envoyez les données au serveur via AJAX
    $.ajax({
      url: "modifier-commande.php",
      method: "POST",
      dataType: "json",
      data: {
        id: id,
        nom: name,
        prix: price,
        quantite_reservee: quantity
      },
      success: function(data) {
        if (data.success) {
          alert("Commande modifiée avec succès.");
          location.reload(); // Rechargez la page pour afficher les nouvelles données
        } else {
          alert("Erreur lors de la modification de la commande. Veuillez réessayer.");
        }
      },
      error: function(error) {
        console.error("Erreur lors de la modification de la commande:", error);
        alert("Erreur lors de la modification de la commande. Veuillez réessayer.");
      }
    });
  });

  // Suppression de commande
  $(".delete-order").click(function() {
    if (confirm("Êtes-vous sûr de vouloir supprimer cette commande ?")) {
      var id = $(this).data('id');

      // Envoyez les données au serveur via AJAX
      $.ajax({
        url: "supprimer-commande.php",
        method: "POST",
        dataType: "json",
        data: { id: id },
        success: function(data) {
          if (data.success) {
            alert("Commande supprimée avec succès.");
            location.reload(); // Rechargez la page pour afficher les nouvelles données
          } else {
            alert("Erreur lors de la suppression de la commande. Veuillez réessayer.");
          }
        },
        error: function(error) {
          console.error("Erreur lors de la suppression de la commande:", error);
          alert("Erreur lors de la suppression de la commande. Veuillez réessayer.");
        }
      });
    }
  });
});
</script>

</body>
</html>
