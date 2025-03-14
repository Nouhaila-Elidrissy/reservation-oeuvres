<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="nav.jsp" %> <!-- Importation de la barre de navigation -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Livres</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <style>
       /* TABLEAU MODERNE */
        table {
            width: 970px;
            margin: 15px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1);
            font-size: 14px;
        }
        th, td {
            padding: 8px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #2c3e50;
            color: white;
            font-size: 14px;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        img {
            display: block;
            margin: auto;
            border-radius: 5px;
            width: 70px;
            height: auto;
        }
        form input[type="submit"] {
            color: #fff;
            border: none;
            padding: 6px 12px;
            cursor: pointer;
            border-radius: 4px;
            font-size: 12px;
            transition: 0.3s;
            margin: 5px;
        }
        .delete-btn { background: #e74c3c; }
        .delete-btn:hover { background: #c0392b; }
        .confirm-btn { background: #27ae60; }
        .confirm-btn:hover { background: #218c53; }
        .search-bar {
            margin: 20px auto;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .search-bar {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 20px 0;
    }
		h2 {
            text-align: center;
            color: #333;
            padding: 20px;
        }
        
        /* Barre de recherche */
        .search-bar {
            display: flex;
            justify-content: center;
            margin-bottom: 15px;
        }
        .search-bar input[type="text"] {
            padding: 8px;
            width: 250px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        .search-bar button {
            background-color: #2c3e50;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            border-radius: 5px;
            margin-left: 5px;
        }
        .search-bar button i {
            font-size: 14px;
        }
        @media (max-width: 768px) {
            table {
                width: 100%;
                font-size: 12px;
            }
            th, td {
                padding: 6px;
            }
            img {
                width: 40px;
                height: 60px;
            }
            .search-bar input {
                width: 200px;
            }
        }
    </style>
    
</head>
<body>
    <div class="content">
        <h2>Liste des Livres</h2>

        <!-- Barre de recherche -->
        <div class="search-bar">
            <form action="listBooks.jsp" method="get">
                <input type="text" name="search" placeholder="Rechercher par titre ou auteur" value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
                <button type="submit"><i class="fas fa-search"></i></button>
            </form>
        </div>

        <table>
            <tr>
                <th>ID</th>
                <th>Titre</th>
                <th>Auteur</th>
                <th>Description</th>
                <th>Stock</th>
                <th>Image</th>
                <th>Action</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblio", "root", "");
                    Statement stmt = conn.createStatement();
                    
                    // Récupération du terme de recherche
                    String searchQuery = request.getParameter("search");
                    String sql = "SELECT * FROM books";
                    
                    if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                        sql += " WHERE title LIKE '%" + searchQuery + "%' OR author LIKE '%" + searchQuery + "%'";
                    }
                    
                    ResultSet rs = stmt.executeQuery(sql);
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("author") %></td>
                <td><%= rs.getString("description") %></td>
                <td><%= rs.getInt("stock") %></td>
                <td><img src="<%= rs.getString("image_url") %>" alt="Image du livre"></td>
                <td>
                    <form action="deleteBook.jsp" method="post" onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer ce livre ?');">
                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                        <input type="submit" class="delete-btn" value="&#10008;">
                    </form>
                </td>
            </tr>
            <%
                    }
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </div>
</body>
</html>
