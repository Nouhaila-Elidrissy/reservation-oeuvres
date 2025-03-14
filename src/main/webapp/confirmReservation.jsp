<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    int reservationId = Integer.parseInt(request.getParameter("id"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblio", "root", "");

        String updateQuery = "UPDATE reservations SET status = 'confirmed' WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(updateQuery);
        pstmt.setInt(1, reservationId);
        int rowsUpdated = pstmt.executeUpdate();

        pstmt.close();
        conn.close();

        if (rowsUpdated > 0) {
            response.sendRedirect("ListReservations.jsp?success=1"); // Redirection après confirmation
        } else {
            response.sendRedirect("ListReservations.jsp?error=1");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
