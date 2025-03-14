<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      background: #f4f7f6;
    }

    nav {
      width: 220px;
      background: #2c3e50;
      color: white;
      height: 95vh;
      position: fixed;
      padding: 15px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      box-shadow: 2px 0 10px rgba(0, 0, 0, 0.3);
      position: fixed;
    }

    nav h2 {
      text-align: center;
      font-size: 20px;
      color: #1abc9c;
    }

    nav ul {
      padding: 0;
      list-style: none;
      flex-grow: 1;
    }

    nav ul li {
      margin-bottom: 8px;
    }

    nav ul li a {
      display: flex;
      align-items: center;
      padding: 12px;
      color: white;
      text-decoration: none;
      font-size: 14px;
      border-radius: 5px;
      transition: 0.3s;
    }

    nav ul li a i {
      margin-right: 8px;
    }

    nav ul li a:hover {
      background: #1abc9c;
      transform: scale(1.05);
    }

    .logout-btn {
      width: 100%;
      padding: 10px;
      border: none;
      background: #e74c3c;
      color: white;
      font-size: 14px;
      border-radius: 5px;
      cursor: pointer;
      transition: 0.3s;
    }

    .logout-btn:hover {
      background: #c0392b;
    }

    .content {
     
      padding: 10px;
      margin-left: 120px;
      
      
    }

    h2 {
      font-size: 20px;
      color: #2c3e50;
    }

    p {
      font-size: 14px;
      color: #34495e;
    }

    
    
  </style>
</head>

<body>
  <nav>
    <div>
      <h2>BiblioSphere</h2>
      <ul>
        <li><a href="listBooks.jsp"><i class="fas fa-book"></i> Livres</a></li>
        <li><a href="afficherClients.jsp"><i class="fas fa-users"></i> Clients</a></li>
        <li><a href="ListReservations.jsp"><i class="fas fa-calendar-check"></i> Réservations</a></li>
        <li><a href="addBook.jsp"><i class="fas fa-plus-circle"></i> Ajouter</a></li>
      </ul>
    </div>
    <button class="logout-btn" onclick="logout()">
      <i class="fas fa-sign-out-alt"></i> Déconnexion
    </button>
  </nav>

  <div class="content">
    
  </div>

  <script>
    function logout() {
      if (confirm("Êtes-vous sûr de vouloir vous déconnecter ?")) {
        window.location.href = "login.jsp";
      }
    }
  </script>

</body>

</html>
