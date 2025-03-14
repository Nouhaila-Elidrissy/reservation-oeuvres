 <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<%
    HttpSession sessionObj = request.getSession(false);
    String username = (sessionObj != null) ? (String) sessionObj.getAttribute("user") : null;

    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String email = "", address = "";

    try {
        // Charger le driver JDBC
        Class.forName("com.mysql.jdbc.Driver");

        // Établir la connexion avec la base de données
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb", "root", "");

        // Préparer la requête SQL pour obtenir l'email et l'adresse de l'utilisateur
        PreparedStatement ps = conn.prepareStatement("SELECT email, address FROM users WHERE username = ?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();

        // Récupérer les résultats
        if (rs.next()) {
            email = rs.getString("email");
            address = rs.getString("address");
        } else {
            email = "Email non trouvé";
            address = "Adresse non trouvée";
        }

        // Fermer les ressources
        rs.close();
        ps.close();
        conn.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Mon compte</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Style moderne et épuré */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            height: 100%;
            font-family: 'Poppins', sans-serif;
            background-color: #f0f2f5;
        }

        header, footer {
            width: 100%;
            z-index: 2;
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 15px 0;
        }

        nav ul {
            list-style-type: none;
            display: flex;
            justify-content: center;
        }

        nav ul li {
            margin: 0 15px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-size: 18px;
        }

        nav ul li a:hover {
            text-decoration: underline;
        }

        .container {
            max-width: 600px;
            margin: 100px auto;
            background-color: white;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            text-align: center;
        }

        .info-box {
            width: 400px;
            margin: 0 auto;
            background: rgba(0, 0, 0, 0.6);
            color: white;
            padding: 30px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f0f2f5;
        }

        .info input[disabled] {
            background-color: #e9ecef;
            color: #495057;
        }

        h2 {
            font-size: 2.5rem;
            color: #333;
            margin-bottom: 20px;
        }

        .info {
            margin-bottom: 20px;
        }

        .info p {
            font-size: 1.2rem;
            color: #555;
        }

        .info strong {
            display: block;
            margin-bottom: 10px;
            color: #007bff;
        }

        .back-home {
            margin-top: 20px;
        }

        .back-home a {
            color: #007bff;
            text-decoration: none;
        }

        .back-home a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="index.jsp"><i class="fas fa-home"></i> Accueil</a></li>
                <li><a href="livres.jsp"><i class="fas fa-book"></i> Réserver un livre</a></li>
                <li><a href="apropos.jsp"><i class="fas fa-info-circle"></i> À propos de nous</a></li>
                <li><a href="account.jsp"><i class="fas fa-user"></i> <%= username %></a></li>
                <li><a href="login.jsp"><i class="fas fa-sign-out-alt"></i> Déconnexion</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <h2>Mon compte</h2>
        <div class="info-box">
            <label for="username">Nom d'utilisateur :</label>
            <input type="text" id="username" name="username" value="<%= username %>" disabled><br>

            <label for="email">Email :</label>
            <input type="email" id="email" name="email" value="<%= email %>" disabled><br>

            <label for="address">Adresse :</label>
            <input type="text" id="address" name="address" value="<%= address %>" disabled><br>
        </div>

        <div class="back-home">
            <a href="index.jsp">Retour à l'accueil</a>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 BiblioSphère. Tous droits réservés.</p>
    </footer>
</body>
</html>
 