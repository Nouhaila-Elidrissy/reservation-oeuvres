<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

HttpSession sessionObj = request.getSession(false);
Integer userId = (sessionObj != null) ? (Integer) sessionObj.getAttribute("userId") : null;

if (userId == null) {
    response.sendRedirect("login.jsp");
    return;
}


    // Tableau des URLs d'images pour chaque chambre
    String[] images = {
        "https://i.pinimg.com/236x/6c/3a/90/6c3a901b89d76ea89337a05714697adc.jpg",
        "https://i.pinimg.com/236x/91/e4/5c/91e45c435f636446702d987fcb6aaf9b.jpg",
        "https://i.pinimg.com/736x/20/d1/a6/20d1a65703a999cd0b39f87d7bb41c1d.jpg",
        "https://i.pinimg.com/474x/24/d1/72/24d172e10d06b80a0bec4134d6d4c1f7.jpg",
        "https://i.pinimg.com/474x/7f/d0/f8/7fd0f86d7819268ad522d1e02a6aa860.jpg",
        
        "https://i.pinimg.com/474x/b4/3c/ac/b43cac0d8cb8f71b05804d600851254f.jpg",
        
        "https://i.pinimg.com/474x/c5/ba/68/c5ba6877e37afc66e8b988e647ff2cc3.jpg",
        
        "https://i.pinimg.com/736x/b0/19/ec/b019eca3d1d22a3ce2d2526cd5a5804c.jpg",
        
        "https://i.pinimg.com/474x/f8/87/11/f88711344aee1bb2011b7d4503297bf2.jpg",
 
        "https://i.pinimg.com/474x/e1/dd/98/e1dd98601bdbf8e04edceee30de03df5.jpg"
    };

    // Tableau des descriptions pour chaque chambre
    String[] descriptions = {
        "Things We  Never Get Over",
        "The Silent Patient",
        "Atomic Habits.",
        "Psycology  of Money.",
        "Women Who Thinks Too Much.",
        "Good Vibes Good Life",
        "Focus On What Matters",
        "The Art Of Laziness",
        "Zero To One",
        "Surrounded By idiots"
    };

   
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Livres - Réservation de livres</title>
  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            font-family: Arial, sans-serif;
            min-height: 100%;
            position: relative;
            padding-top: 60px; /* Espace pour le header */
            padding-bottom: 50px; /* Espace pour le footer */
        }

        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            background: rgba(0, 0, 0, 0.8);
            padding: 10px 0;
        }

        footer {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            background: rgba(0, 0, 0, 0.8);
            padding: 10px;
            text-align: center;
            color: white;
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

        /* Conteneur des chambres */
    .book-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* Afficher 3 livres par ligne */
    gap: 20px; /* Espacement entre les éléments */
    padding: 50px;
    justify-content: center;
    align-items: start;
}

.book-box {
    background-color: rgba(255, 255, 255, 0.9);
    border-radius: 15px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    overflow: hidden;
    transition: transform 0.3s ease;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 15px;
    height: auto;
    width: 100%; /* Assurer un bon alignement */
}


        .book-box:hover {
            transform: translateY(-10px);
        }

        .book-box img {
            width: 250px; /* Taille réduite pour les images */
            height: 140px; /* Hauteur fixe */
            object-fit: cover; /* Conserve le ratio de l'image, la recadre si nécessaire */
            margin-bottom: 10px;
        }

        .book-details {
            text-align: center;
        }

        .book-details h3 {
            font-size: 18px; /* Réduire la taille du texte */
            margin-bottom: 8px;
        }

        .book-details p {
            font-size: 14px; /* Réduire la taille du texte */
            color: #666;
            margin-bottom: 10px;
        }

        .book-details .price {
            font-size: 16px; /* Réduire la taille du texte */
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        .book-details .btn-reserve {
            padding: 8px 15px; /* Réduire la taille du bouton */
            background-color: #f5b700;
            color: black;
            border: none;
            border-radius: 30px;
            font-size: 14px; /* Réduire la taille du texte */
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .book-details .btn-reserve:hover {
            background-color: #e0a500;
        }
    </style>
</head>
<body>

    <!-- HEADER -->
    <header>
        <div class="logo">
            <img src="" >
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp"><i class="fas fa-home"></i> Accueil</a></li>
                <li> <a href="livres.jsp" ><i class="fas fa-book"></i> Réserver un livre</a></li>
                <li><a href="apropos.jsp"><i class="fas fa-info-circle"></i> À propos de nous</a></li>
              
                <li><a href="login.jsp"><i class="fas fa-sign-out-alt"></i> Déconnexion</a></li>
            </ul>
        </nav>
    </header>

    <!-- Conteneur des livres -->
 
       <section class="book-container">
    <% for (int i = 0; i < images.length; i++) { %>
        <div class="book-box">
            <img src="<%= images[i] %>" alt="book <%= i+1 %>">
            <div class="book-details">
                <h3>Article <%= i+1 %></h3>
                <p><%= descriptions[i] %></p> <!-- Description spécifique pour chaque livre -->
                
                <!-- Formulaire placé ici, à l’intérieur de la box -->
                <form action="ReserveBookServlet" method="post" onsubmit="return confirmReservation(this);">
    <input type="hidden" name="bookId" value="<%= i+1 %>">
    <input type="hidden" id="reservationDuration<%= i %>" name="reservationDuration">
    <button type="submit" class="btn-reserve">Réserver</button>
</form>

<script>
    function confirmReservation(form) {
        var duration = prompt("Veuillez entrer la durée de réservation en jours :");
        if (duration !== null && duration !== "") {
            form.querySelector('input[name="reservationDuration"]').value = duration;
            return true;
        } else {
            alert("Veuillez entrer une durée valide.");
            return false;
        }
    }
</script>

            </div>
        </div>
    <% } %>
</section>

   

    <!-- FOOTER -->
    <footer>
        <p>&copy; 2025 BiblioSphère. Tous droits réservés.</p>
    </footer>

</body>
</html>
