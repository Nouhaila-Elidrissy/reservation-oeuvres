<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate, java.time.temporal.ChronoUnit" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Livres Empruntés</title>
</head>
<body>
    <h2>Liste des Livres Empruntés</h2>
    <table border="1">
        <tr>
            <th>ID Réservation</th>
            <th>Nom Utilisateur</th>
            <th>Email</th>
            <th>Téléphone</th>
            <th>Titre du Livre</th>
            <th>Image du Livre</th>
            <th>Date de Réservation</th>
            <th>Durée Emprunt (jours)</th>
            <th>Durée Restante (jours)</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblio", "root", "");
                Statement stmt = conn.createStatement();
                
                String query = "SELECT r.id AS reservation_id, u.username, u.email, u.telephone, " +
                               "b.title, b.image_url, r.reservation_date, r.duration, r.status " +
                               "FROM reservations r " +
                               "JOIN users u ON r.user_id = u.id " +
                               "JOIN books b ON r.book_id = b.id " +
                               "WHERE r.status = 'confirmed'";
                               
                ResultSet rs = stmt.executeQuery(query);

                while (rs.next()) {
                    int reservationId = rs.getInt("reservation_id");
                    String username = rs.getString("username");
                    String email = rs.getString("email");
                    String telephone = rs.getString("telephone");
                    String bookTitle = rs.getString("title");
                    String imageUrl = rs.getString("image_url");
                    Timestamp reservationDate = rs.getTimestamp("reservation_date");
                    int duration = rs.getInt("duration");

                    // Convertir la date de réservation en LocalDate
                    LocalDate dateReservation = reservationDate.toLocalDateTime().toLocalDate();
                    LocalDate dateRetour = dateReservation.plusDays(duration);
                    LocalDate today = LocalDate.now();
                    long dureeRestante = ChronoUnit.DAYS.between(today, dateRetour);
        %>
        <tr <% if (dureeRestante <= 3) { %> style="background-color: red; color: white;" <% } %> >
            <td><%= reservationId %></td>
            <td><%= username %></td>
            <td><%= email %></td>
            <td><%= telephone %></td>
            <td><%= bookTitle %></td>
            <td><img src="<%= imageUrl %>" alt="Image du Livre" width="50" height="75"></td>
            <td><%= dateReservation %></td>
            <td><%= duration %></td>
            <td><%= dureeRestante %> jours</td>
        </tr>
        <%
                }
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
