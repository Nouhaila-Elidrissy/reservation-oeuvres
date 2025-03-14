<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <!-- Importation de la barre de navigation -->
<!DOCTYPE html>
<html>
<head>
    <title>Ajouter un Livre</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <style>
    body {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    background: #f4f7f6;
}

/* Barre de navigation */
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
    margin-bottom: 10px;
}

nav ul li a {
    display: flex;
    align-items: center;
    padding: 12px;
    color: white;
    text-decoration: none;
    font-size: 14px;
    border-radius: 5px;
    transition: 0.3s ease-in-out;
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

/* Contenu principal */
.content {
    margin-left: 250px; /* Pour éviter que le contenu ne soit caché par la barre latérale */
    width: calc(100% - 250px);
    padding: 30px;
}

h2 {
    font-size: 22px;
    color: #2c3e50;
    text-align: center;
    margin-bottom: 20px;
}

/* Formulaire */
form {
    width: 60%;
    max-width: 500px;
    margin: auto;
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
}

label {
    font-weight: bold;
    display: block;
    margin-top: 10px;
    color: #2c3e50;
}

input, textarea {
    width: 95%;
    padding: 8px;
    margin-top: 5px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
}

textarea {
    height: 80px;
    resize: none;
}

/* Bouton */
button {
    display: block;
    width: 100%;
    padding: 12px;
    margin-top: 15px;
    background-color: #1abc9c;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s ease-in-out;
}

button:hover {
    background-color: #16a085;
    transform: scale(1.05);
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
    <h2>Ajouter un Livre</h2>
    <form action="AddBookServlet" method="post" enctype="multipart/form-data">
        <label for="title">Titre :</label>
        <input type="text" name="title" required>

        <label for="author">Auteur :</label>
        <input type="text" name="author" required>

        <label for="description">Description :</label>
        <textarea name="description" required></textarea>

        <label for="stock">Stock :</label>
        <input type="number" name="stock" min="1" required>

        <label for="image">Image :</label>
        <input type="file" name="image" accept="image/*" required>

        <button type="submit">Ajouter</button>
    </form>
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
