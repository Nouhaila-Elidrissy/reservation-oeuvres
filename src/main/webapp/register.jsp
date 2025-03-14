<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Créer un compte - Réservation de livres</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-image: url('https://i.pinimg.com/736x/45/33/27/453327199bec067da79ea3312e77d384.jpg'); /* Image de fond */
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        background-attachment: fixed;
      }

      .container {
        background: rgba(0, 0, 0, 0.7); 
        padding: 20px 30px;
        border-radius: 20px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        width: 600px;
        text-align: center;
        color: white;
      }

      h1 {
        margin-bottom: 20px;
        font-size: 2.5em;
        font-weight: bold;
        letter-spacing: 2px;
        text-transform: uppercase;
        color: #f5b700; 
      }

      .grid-container {
        display: grid;
        grid-template-columns: 1fr 1fr; /* Deux colonnes pour afficher deux champs par ligne */
        gap: 15px;
      }

      .form-group {
        position: relative;
        margin-bottom: 20px;
      }

      .form-group i {
        position: absolute;
        left: 10px;
        top: 50%;
        transform: translateY(-50%);
        color: #ccc; 
      }

      input[type="text"], input[type="email"], input[type="password"], select {
        padding: 12px 12px 12px 40px;
        width: 80%;
        border: 1px solid #ccc;
        border-radius: 10px;
        font-size: 16px;
        background-color: rgba(255, 255, 255, 0.1);
        color: white;
      }

      input[type="text"]::placeholder, input[type="email"]::placeholder, input[type="password"]::placeholder {
        color: #bbb;
      }

      select {
        color: #bbb;
      }

      button.submit-btn {
        padding: 12px;
        background-color: #f5b700;
        color: black;
        border: none;
        border-radius: 50px;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.3s ease;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
        margin-top: 10px;
        width: 100%;
      }

      button.submit-btn:hover {
        background-color: #e0a500;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        transform: translateY(-3px);
      }

      p {
        margin-top: 15px;
        font-size: 14px;
        color: #ccc;
      }

      a {
        color: #f5b700;
        text-decoration: none;
      }

      a:hover {
        text-decoration: underline;
      }

      .success-message {
        background-color: #d4edda;
        color: #155724;
        padding: 15px;
        border: 1px solid #c3e6cb;
        border-radius: 10px;
        margin-bottom: 20px;
        text-align: center;
        color: black;
      }

      .error-message {
        background-color: #f8d7da;
        color: #721c24;
        padding: 15px;
        border: 1px solid #f5c6cb;
        border-radius: 10px;
        margin-bottom: 20px;
        text-align: center;
        color: black;
      }
    </style>
</head>
<body>
    <div class="container">
        <h1>Créer un compte</h1>

        <!-- Affichage du message de succès ou d'erreur -->
        <% 
            String successMessage = (String) request.getAttribute("successMessage");
            String errorMessage = (String) request.getAttribute("errorMessage");

            if (successMessage != null) {
        %>
            <div class="success-message"><%= successMessage %></div>
            <script>
                setTimeout(function() {
                    window.location.href = "login.jsp";
                }, 2000); // Redirige vers login.jsp après 2 secondes
            </script>
        <% 
            } else if (errorMessage != null) {
        %>
            <div class="error-message"><%= errorMessage %></div>
        <% 
            } 
        %>

        <form action="RegisterServlet" method="post">
            <div class="grid-container">
                <div class="form-group">
                    <i class="fas fa-user"></i>
                    <input type="text" id="username" name="username" placeholder="Nom d'utilisateur" required>
                </div>

                <div class="form-group">
                    <i class="fas fa-envelope"></i>
                    <input type="email" id="email" name="email" placeholder="Email" required>
                </div>

                <div class="form-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" id="password" name="password" placeholder="Mot de passe" required>
                </div>

                <div class="form-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" id="confirm-password" name="confirm_password" placeholder="Confirmer le mot de passe" required>
                </div>

                <div class="form-group">
                    <i class="fas fa-phone"></i>
                    <input type="text" id="phone" name="telephone" placeholder="Téléphone" required>
                </div>

                <!-- Nouveau champ pour l'adresse -->
                <div class="form-group">
                    <i class="fas fa-map-marker-alt"></i>
                    <input type="text" id="address" name="address" placeholder="Adresse" required>
                </div>
            </div>

            <button type="submit" class="submit-btn">Créer un compte</button>
            <p><a href="login.jsp">Se connecter</a></p>
        </form>
    </div>
</body>
</html>
