<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
    if (id != null && !id.isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblio", "root", "");
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM users WHERE id = ?");
            stmt.setInt(1, Integer.parseInt(id));
            int rows = stmt.executeUpdate();
            conn.close();

            if (rows > 0) {
                response.sendRedirect("afficherClients.jsp");
            } else {
                out.println("<p>Erreur : Le Client n'a pas été trouvé.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Erreur : Impossible de supprimer le Client.</p>");
        }
    } else {
        out.println("<p>Erreur : ID invalide.</p>");
    }
%>
