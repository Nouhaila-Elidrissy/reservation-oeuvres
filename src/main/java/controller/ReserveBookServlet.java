package controller;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ReserveBookServlet")
public class ReserveBookServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/biblio";
    private static final String JDBC_USER = "root"; 
    private static final String JDBC_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int reservationDuration = Integer.parseInt(request.getParameter("reservationDuration")); // Récupérer la durée de réservation

        try (Connection conn = DatabaseConnection.getConnection()) {
            conn.setAutoCommit(false);

            String checkStockQuery = "SELECT stock FROM books WHERE id = ?";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkStockQuery)) {
                checkStmt.setInt(1, bookId);
                try (ResultSet rs = checkStmt.executeQuery()) {
                    if (rs.next() && rs.getInt("stock") > 0) {
                        // Insérer la réservation avec la durée
                        String insertReservationQuery = "INSERT INTO reservations (user_id, book_id, duration) VALUES (?, ?, ?)";
                        try (PreparedStatement insertStmt = conn.prepareStatement(insertReservationQuery)) {
                            insertStmt.setInt(1, userId);
                            insertStmt.setInt(2, bookId);
                            insertStmt.setInt(3, reservationDuration); // Stocker la durée
                            insertStmt.executeUpdate();
                        }

                        String updateStockQuery = "UPDATE books SET stock = stock - 1 WHERE id = ?";
                        try (PreparedStatement updateStmt = conn.prepareStatement(updateStockQuery)) {
                            updateStmt.setInt(1, bookId);
                            updateStmt.executeUpdate();
                        }

                        conn.commit();
                        response.sendRedirect("reservationSuccess.jsp");
                    } else {
                        conn.rollback();
                        response.sendRedirect("outOfStock.jsp");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
