/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Servlets.UsuarioServlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author GUSTAVO
 */
public abstract class BaseDao {
    
    private final String host = "database-3.cgwtwqd4gav8.us-east-1.rds.amazonaws.com";
    private final String url = "jdbc:mysql://"+host+":3306/mydb?serverTimezone=America/Lima&useSSL=false&allowPublicKeyRetrieval=true";
    private final String user = "admin";
    private final String password = "testpassword123456";
    
    
    public Connection getConnection() throws SQLException{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return DriverManager.getConnection(this.url, this.user, this.password);
    }
    
    
}