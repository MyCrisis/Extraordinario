package Funcionalidades;

import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;

public class Conexion{
    public static Connection getConexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            final String url = "jdbc:mysql://localhost:8080/Extraordinario";
            final String usuario = "root";
            final String clave = "n0m3l0";
            return DriverManager.getConnection(url, usuario, clave);
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        catch (Exception ex2) {
            ex2.printStackTrace();
        }
        return null;
    }
}