/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Beans.Estado;
import Beans.Rol;
import Beans.Usuario;
import Servlets.UsuarioServlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author GUSTAVO
 */
public class UsuarioDao {
    
    
        public ArrayList<Usuario> listarUsuario(){

            ArrayList<Usuario> usuario = new ArrayList<>();

            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch(ClassNotFoundException ex){
                Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            String host = "database-3.cgwtwqd4gav8.us-east-1.rds.amazonaws.com";
            String url = "jdbc:mysql://"+host+":3306/mydb?serverTimezone=America/Lima&useSSL=false&allowPublicKeyRetrieval=true";
            String user = "admin";
            String password = "testpassword123456";

            String sql = "SELECT u.codigoPucp, u.nombre, u.apellido, u.correoPucp, u.condicion, r.nombre_rol, e.estado  FROM Usuarios u\n" +
    "inner join Rol r on u.Rol_idRol = r.idRol\n" +
    "inner join EstadoUsuario e on e.idEstado = u.Estado_idEstado  where e.idEstado in (1,2)";
            try(Connection conn = DriverManager.getConnection(url,user, password);
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql); )
            {
                while(rs.next())
                {
                    Usuario u = new Usuario();
                    u.setNombre(rs.getString(2));
                    u.setCodigoPucp(rs.getInt(1));
                    u.setApellido(rs.getString(3));
                    u.setCondicion(rs.getString(5));
                    u.setCorreoPucp(rs.getString(4));

                    Rol r = new Rol();
                    r.setRol(rs.getString(6));
                    u.setRol(r);

                    Estado e = new Estado();
                    e.setEstado(rs.getString(7));
                    u.setEstado(e);
                    usuario.add(u);


                }

            }
            catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }


            System.out.println(usuario.size());
            return usuario;
        }
        
        
        
        public ArrayList<Usuario> listarUsuarioNR(){
            ArrayList<Usuario> usuario = new ArrayList<>();

            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch(ClassNotFoundException ex){
                Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            String host = "database-3.cgwtwqd4gav8.us-east-1.rds.amazonaws.com";
            String url = "jdbc:mysql://"+host+":3306/mydb?serverTimezone=America/Lima&useSSL=false&allowPublicKeyRetrieval=true";
            String user = "admin";
            String password = "testpassword123456";

            String sql = "SELECT u.codigoPucp, u.nombre, u.apellido, u.correoPucp, u.condicion, r.nombre_rol, e.estado  FROM Usuarios u\n" +
    "inner join Rol r on u.Rol_idRol = r.idRol\n" +
    "inner join EstadoUsuario e on e.idEstado = u.Estado_idEstado where e.idEstado = 2";
            try(Connection conn = DriverManager.getConnection(url,user, password);
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql); )
            {
                while(rs.next())
                {
                    Usuario u = new Usuario();
                    u.setNombre(rs.getString(2));
                    u.setCodigoPucp(rs.getInt(1));
                    u.setApellido(rs.getString(3));
                    u.setCondicion(rs.getString(5));
                    u.setCorreoPucp(rs.getString(4));

                    Rol r = new Rol();
                    r.setRol(rs.getString(6));
                    u.setRol(r);

                    Estado e = new Estado();
                    e.setEstado(rs.getString(7));
                    u.setEstado(e);
                    usuario.add(u);


                }

            }
            catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }


            System.out.println(usuario.size());
            return usuario;
        }
        
                
        public ArrayList<Usuario> listarUsuarioBaneado(){
            ArrayList<Usuario> usuario = new ArrayList<>();

            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch(ClassNotFoundException ex){
                Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            String host = "database-3.cgwtwqd4gav8.us-east-1.rds.amazonaws.com";
            String url = "jdbc:mysql://"+host+":3306/mydb?serverTimezone=America/Lima&useSSL=false&allowPublicKeyRetrieval=true";
            String user = "admin";
            String password = "testpassword123456";

            String sql = "SELECT u.codigoPucp, u.nombre, u.apellido, u.correoPucp, u.condicion, r.nombre_rol, e.estado  FROM Usuarios u\n" +
    "inner join Rol r on u.Rol_idRol = r.idRol\n" +
    "inner join EstadoUsuario e on e.idEstado = u.Estado_idEstado where e.idEstado = 3";
            try(Connection conn = DriverManager.getConnection(url,user, password);
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql); )
            {
                while(rs.next())
                {
                    Usuario u = new Usuario();
                    u.setNombre(rs.getString(2));
                    u.setCodigoPucp(rs.getInt(1));
                    u.setApellido(rs.getString(3));
                    u.setCondicion(rs.getString(5));
                    u.setCorreoPucp(rs.getString(4));

                    Rol r = new Rol();
                    r.setRol(rs.getString(6));
                    u.setRol(r);

                    Estado e = new Estado();
                    e.setEstado(rs.getString(7));
                    u.setEstado(e);
                    usuario.add(u);


                }

            }
            catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }


            System.out.println(usuario.size());
            return usuario;
        }
        
        
        public ArrayList<Usuario> listarDA(){

            ArrayList<Usuario> usuario = new ArrayList<>();

            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch(ClassNotFoundException ex){
                Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            String host = "database-3.cgwtwqd4gav8.us-east-1.rds.amazonaws.com";
            String url = "jdbc:mysql://"+host+":3306/mydb?serverTimezone=America/Lima&useSSL=false&allowPublicKeyRetrieval=true";
            String user = "admin";
            String password = "testpassword123456";

            String sql = "SELECT u.codigoPucp, u.nombre, u.apellido, u.correoPucp, u.condicion, r.nombre_rol, e.estado  FROM Usuarios u\n" +
    "inner join Rol r on u.Rol_idRol = r.idRol\n" +
    "inner join EstadoUsuario e on e.idEstado = u.Estado_idEstado  where e.idEstado = 1 and r.idRol = 2";
            try(Connection conn = DriverManager.getConnection(url,user, password);
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql); )
            {
                while(rs.next())
                {
                    Usuario u = new Usuario();
                    u.setNombre(rs.getString(2));
                    u.setCodigoPucp(rs.getInt(1));
                    u.setApellido(rs.getString(3));
                    u.setCondicion(rs.getString(5));
                    u.setCorreoPucp(rs.getString(4));

                    Rol r = new Rol();
                    r.setRol(rs.getString(6));
                    u.setRol(r);

                    Estado e = new Estado();
                    e.setEstado(rs.getString(7));
                    u.setEstado(e);
                    usuario.add(u);


                }

            }
            catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }


            System.out.println(usuario.size());
            return usuario;
        }
}
