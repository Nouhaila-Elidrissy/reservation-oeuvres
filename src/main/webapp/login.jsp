<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Connexion </title>
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
    background: rgba(0, 0, 0, 0.7); /* Fond similaire à celui de la boîte de bienvenue */
    padding: 40px 50px; /* Espace accru pour correspondre à la boîte de bienvenue */
    border-radius: 20px; /* Coins arrondis */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3); /* Ombres douces */
    width: 400px; /* Taille similaire à la boîte de bienvenue */
    text-align: center;
    color: white; /* Texte blanc */
}

h1 {
    margin-bottom: 20px;
    font-size: 2.5em;
    font-weight: bold;
    letter-spacing: 2px;
    text-transform: uppercase;
    color: #f5b700; /* Couleur similaire à la boîte de bienvenue */
}

form {
    display: flex;
    flex-direction: column;
}

.input-group {
    position: relative;
    margin-bottom: 20px;
}

.input-group i {
    position: absolute;
    left: 10px;
    top: 50%;
    transform: translateY(-50%);
    color: #ccc; /* Couleur de l'icône légèrement plus claire */
}

input[type="text"], input[type="password"] {
    padding: 12px 12px 12px 40px; /* Plus d'espace pour l'icône */
    width: 90%;
    border: 1px solid #ccc;
    border-radius: 10px;
    font-size: 16px;
    background-color: rgba(255, 255, 255, 0.1); /* Légère transparence pour correspondre au thème */
    color: white;
}

input[type="text"]::placeholder, input[type="password"]::placeholder {
    color: #bbb; /* Placeholder couleur claire */
}

button {
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
}

button:hover {
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


        .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Connexion</h1>

        <form action="LoginServlet" method="post">
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" id="username" name="username" placeholder="Nom d'utilisateur" required>
            </div>
            
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" id="password" name="password" placeholder="Mot de passe" required>
            </div>
            
            <button type="submit">Se connecter</button>
            <p>Vous n'avez pas de compte ? <a href="register.jsp">Créer un compte</a></p>
        </form>

        <%
            // Afficher un message d'erreur si l'authentification échoue
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <p style="color:red;"><%= errorMessage %></p>
        <%
            }
        %>
    </div>
</body>
</html>