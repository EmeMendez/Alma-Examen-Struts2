/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import java.sql.SQLException;

import javax.swing.JOptionPane;

/**
 *
 * @author valvader
 */
public class Conexion {
    private static Connection conexion=null;
   
    public static Connection GetConexion() {
        Statement stat=null;

        try
        {
            
            Class.forName("com.mysql.jdbc.Driver");
//            String servidor = "jdbc:mysql://localhost/bd_ejemplo";
            String servidor = "jdbc:mysql://localhost/bd_emelinda_mendez_examen";
            String usuarioDB="java";
            String passwordDB="1234";
            conexion= DriverManager.getConnection(servidor,usuarioDB,passwordDB);
            stat=conexion.createStatement();
             /*
            Class.forName("com.mysql.jdbc.Driver");
            String servidor = "jdbc:mysql://localhost/NuevaVader";
            String usuarioDB="root";
            String passwordDB="a123456";
            conexion= DriverManager.getConnection(servidor,usuarioDB,passwordDB);
            stat=conexion.createStatement();
                    */
        }
        catch(ClassNotFoundException ex)
        {
            JOptionPane.showMessageDialog(null, ex, "Error en la Conexión "+ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            conexion=null;
        }
        catch(SQLException ex)
        {
            JOptionPane.showMessageDialog(null, ex, "Error SQL en la Conexión"+ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            conexion=null;
        }
        catch(Exception ex)
        {
            JOptionPane.showMessageDialog(null, ex, "Error común en la Conexión"+ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            conexion=null;
        }
        finally
        {
            return conexion;
        }
    }
    
}
