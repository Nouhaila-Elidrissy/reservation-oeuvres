package controller;




import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/biblio";
    private static final String USER = "root"; // Remplace par ton utilisateur MySQL
    private static final String PASSWORD = ""; // Remplace par ton mot de passe MySQL

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Charge le driver JDBC MySQL
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Erreur de chargement du driver JDBC", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
