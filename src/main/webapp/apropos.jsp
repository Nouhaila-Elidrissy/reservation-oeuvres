<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    HttpSession sessionObj = request.getSession(false);
    String username = (sessionObj != null) ? (String) sessionObj.getAttribute("user") : null;

    if (username == null) {
        response.sendRedirect("login.jsp"); 
        return;
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>À propos de nous - BiblioSphère</title>
  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body, html {
            height: 100%;
            font-family: Arial, sans-serif;
        }

        header, footer {
            position: absolute;
            width: 100%;
            z-index: 2;
            color: white;
            background: none;
        }

        header {
            top: 0;
        }

        footer {
            bottom: 0;
            text-align: center;
            padding: 10px;
        }

        .logo img {
            height: 50px;
        }

        nav ul {
            list-style-type: none;
            display: flex;
            justify-content: flex-end;
            padding: 15px;
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

        /* Style pour le carrousel en arrière-plan */
        .fullscreen-carousel {
            position: relative;
            height: 100vh;
            overflow: hidden;
        }

        .fullscreen-carousel img {
            position: absolute;
            width: 100%;
            height: 100%;
            object-fit: cover;
            top: 0;
            left: 0;
            opacity: 0;
            transition: opacity 1s ease-in-out;
            filter: brightness(70%);
        }

        .fullscreen-carousel img.active {
            opacity: 1;
        }

        /* Style de la boîte de contenu similaire à la page d'accueil */
        .about-box {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(0, 0, 0, 0.6); /* Fond semi-transparent */
            color: white;
            padding: 40px 60px;
            border-radius: 20px;
            text-align: center;
            z-index: 3;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            width: 80%; /* Largeur ajustée pour les paragraphes */
            max-width: 800px;
        }

        .about-box h2 {
            margin-bottom: 20px;
            font-size: 2.8em;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 2px;
            color: #f5b700;
        }

        .about-box p {
            font-size: 1.2em;
            line-height: 1.8em;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <!-- HEADER -->
    <header>
        <div class="logo">
            <img src="" alt="">
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp"><i class="fas fa-home"></i> Accueil</a></li>
                <li><a href="livres.jsp"><i class="fas fa-book"></i> Réserver un livre</a></li>
                <li><a href="apropos.jsp"><i class="fas fa-info-circle"></i> À propos de nous</a></li>
                 <li>
    <a href="account.jsp">
        <i class="fas fa-user"></i> 
        <%= (username != null) ? username : "Mon compte" %> <!-- Affiche le nom de l'utilisateur s'il est connecté -->
    </a>
</li>
                <li><a href="login.jsp"><i class="fas fa-sign-out-alt"></i> Déconnexion</a></li>
            </ul>
        </nav>
    </header>

    <!-- Fullscreen Carousel (arrière-plan) -->
    <section class="fullscreen-carousel">
        <img src="https://i.pinimg.com/736x/45/33/27/453327199bec067da79ea3312e77d384.jpg" alt="" class="active">
        <img src="https://i.pinimg.com/736x/2e/99/9c/2e999c2a92ee09fa8f01001ce1b1ba62.jpg" alt="">
        <img src="https://i.pinimg.com/736x/36/73/50/367350ac253dd2dba8d30803a9366900.jpg" alt="">
    </section>

    <!-- Contenu Principal (Boîte "À propos de nous") -->
    <div class="about-box">
        <h2>À propos de BiblioSphère</h2>
        <p>
            Bienvenue sur BiblioSphère, votre bibliothèque en ligne dédiée à la réservation et à la gestion de livres.
            Notre plateforme vous permet de découvrir une large sélection de livres et de les réserver en toute simplicité.
        </p>
        <p>
            Notre mission est de rendre la lecture accessible à tous, en combinant technologie et amour des livres.
            Nous vous remercions de votre confiance et espérons que vous apprécierez votre expérience sur BiblioSphère.
        </p>
    </div>

    <!-- FOOTER -->
    <footer>
        <p>&copy; 2025 BiblioSphère. Tous droits réservés.</p>
    </footer>

    <script>
        // Script pour le carrousel d'images de fond
        const images = document.querySelectorAll('.fullscreen-carousel img');
        let currentImage = 0;

        function showNextImage() {
            images[currentImage].classList.remove('active');
            currentImage = (currentImage + 1) % images.length;
            images[currentImage].classList.add('active');
        }

        setInterval(showNextImage, 2000); // Change d'image toutes les 2 secondes
    </script>
</body>
</html>
