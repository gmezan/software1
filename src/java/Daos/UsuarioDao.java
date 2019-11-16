/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Beans.Actividad;
import Beans.Estado;
import Beans.Rol;
import Beans.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author GUSTAVO
 */
public class UsuarioDao extends BaseDao{
    
    
        public ArrayList<Usuario> listarUsuario(){

            ArrayList<Usuario> usuario = new ArrayList<>();
            
            String sql = "SELECT u.codigoPucp, u.nombre, u.apellido, u.correoPucp, u.condicion, r.idRol,e.estado,r.nombre_rol,a.idActividad, a.nombreActividad  FROM Usuarios u\n" +
                        "inner join Rol r on u.Rol_idRol = r.idRol\n" +
                        "inner join EstadoUsuario e on e.idEstado = u.Estado_idEstado "
                    + "left join Actividad a on u.codigoPucp = a.delegado_codigoPucp "
                    + "where e.idEstado = 1";
            try(Connection conn = this.getConnection();
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
                    r.setId(rs.getInt(6));
                    r.setRol(rs.getString(8));
                    u.setRol(r);

                    Estado e = new Estado();
                    e.setEstado(rs.getString(7));
                    u.setEstado(e);
                    
                    Actividad a = new Actividad();
                    a.setIdActividad(rs.getInt(9));
                    a.setNombreActividad(rs.getString(10));
                    u.setActividad(a);
                    u.setIdActividad(a.getIdActividad());
                    usuario.add(u);
                    
                    


                }

            }
            catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }
            return usuario;
        }

        
        public ArrayList<Usuario> listarUsuarioNR(){
            ArrayList<Usuario> usuario = new ArrayList<>();

            String sql = "SELECT u.codigoPucp, u.nombre, u.apellido, u.correoPucp, u.condicion, r.nombre_rol, e.estado  FROM Usuarios u\n" +
    "inner join Rol r on u.Rol_idRol = r.idRol\n" +
    "inner join EstadoUsuario e on e.idEstado = u.Estado_idEstado where e.idEstado = 2";
            try(Connection conn = this.getConnection();
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


            return usuario;
        }
                 
        public ArrayList<Usuario> listarUsuarioBaneado(){
            ArrayList<Usuario> usuario = new ArrayList<>();

            String sql = "SELECT u.codigoPucp, u.nombre, u.apellido, u.correoPucp, u.condicion, r.nombre_rol, e.estado  FROM Usuarios u\n" +
    "inner join Rol r on u.Rol_idRol = r.idRol\n" +
    "inner join EstadoUsuario e on e.idEstado = u.Estado_idEstado where e.idEstado = 3";
            try(Connection conn = this.getConnection();
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


            return usuario;
        }       
        
        public ArrayList<Usuario> listarDA(){

            ArrayList<Usuario> usuario = new ArrayList<>();

            String sql = "SELECT u.codigoPucp, u.nombre, u.apellido, u.correoPucp, u.condicion, r.idRol,e.estado,r.nombre_rol,a.idActividad, a.nombreActividad  FROM Usuarios u\n" +
                        "inner join Rol r on u.Rol_idRol = r.idRol\n" +
                        "inner join EstadoUsuario e on e.idEstado = u.Estado_idEstado "
                    + "left join Actividad a on u.codigoPucp = a.delegado_codigoPucp "
                    + "where e.idEstado = 1 and r.idRol = 2";
            try(Connection conn = this.getConnection();
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
                    r.setId(rs.getInt(6));
                    r.setRol(rs.getString(8));
                    u.setRol(r);

                    Estado e = new Estado();
                    e.setEstado(rs.getString(7));
                    u.setEstado(e);
                    
                    Actividad a = new Actividad();
                    a.setIdActividad(rs.getInt(9));
                    a.setNombreActividad(rs.getString(10));
                    u.setActividad(a);
                    u.setIdActividad(a.getIdActividad());
                    usuario.add(u);
                    
                    

                }

            }
            catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }

            return usuario;
        }
        
        
        
    public void borrarUsuario(int codigo){
        String sql = "delete from Usuarios where codigoPucp = ?";
        
        try(Connection conn = this.getConnection();
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                     )
            {
                pstmt.setInt(1, codigo);
                pstmt.executeUpdate();

            }
            catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        
        
    }
    
    public void agregarUsuario(int codigo){
        String sql = "update Usuarios set Estado_idEstado = 1 where (codigoPucp = ?)";
        
        try(Connection conn = this.getConnection();
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                     )
            {
                pstmt.setInt(1, codigo);
                pstmt.executeUpdate();

            }
            catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            } 
    }
    
        public void banearUsuario(int codigo){
        String sql = "update Usuarios set Estado_idEstado = 3 where (codigoPucp = ?)";
        
        try(Connection conn = this.getConnection();
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                     )
            {
                pstmt.setInt(1, codigo);
                pstmt.executeUpdate();

            }
            catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            } 
    }
    
    
    public HashMap<Integer,String> listarActividad(){
        HashMap<Integer,String> dict = new HashMap<>();
        
        String sql = "SELECT idActividad, nombreActividad FROM Actividad where delegado_codigoPucp is null";
            
            try(Connection conn = this.getConnection();
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql); )
            {
                while(rs.next())
                {
                    dict.put(rs.getInt(1), rs.getString(2));
                }
            }
            catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }

        
        return dict;
    }
    
    public HashMap<Integer,String> listarTodasActividades(){
                HashMap<Integer,String> dict = new HashMap<>();

            String sql = "SELECT idActividad, nombreActividad FROM Actividad";
            
            try(Connection conn = this.getConnection();
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql); )
            {
                while(rs.next())
                {
                    dict.put(rs.getInt(1), rs.getString(2));
                }
            }
            catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }

        
        return dict;
        
    }
    
    public void actualizarUsuario(int userId, boolean check, int actId){
        if(check){
            String sql = "update Usuarios set Rol_idRol = 2 where (codigoPucp = ?)";
            String sql2 = "update Actividad set delegado_codigoPucp = ? where (idActividad = ?)";
            String sql3 = "update Actividad set delegado_codigoPucp = NULL where (delegado_codigoPucp = ?)";
            try(Connection conn = this.getConnection();
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                    PreparedStatement pstmt2 = conn.prepareStatement(sql2);
                    PreparedStatement pstmt3 = conn.prepareStatement(sql3);)
            {
                pstmt.setInt(1, userId);
                pstmt.executeUpdate();
                pstmt2.setInt(1, userId);
                pstmt2.setInt(2, actId);
                
                pstmt3.setInt(1, userId);
                pstmt3.executeUpdate();
                pstmt2.executeUpdate();
            }
            catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        else
        {

            String sql = "update Usuarios set Rol_idRol = 1 where codigoPucp = ?";
            
            String sql2 = "update Actividad set delegado_codigoPucp = NULL where idActividad = ?";
            
            
            try(Connection conn = this.getConnection();
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                    PreparedStatement pstmt2 = conn.prepareStatement(sql2);
                     )
            {
                pstmt.setInt(1, userId);
                pstmt.executeUpdate();
                actId = actividadDeDelegado(userId);
                if(actId!=0)
                {
                    pstmt2.setInt(1, actId);
                    pstmt2.executeUpdate();
                }
                      
            }
            catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        
    }
    
    public int actividadDeDelegado(int userId){
        String sql = "SELECT idActividad FROM Actividad where delegado_codigoPucp = ?";
        int id = 0;
        try(Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                 )
        {
            pstmt.setInt(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while(rs.next())
                {
                    id = rs.getInt(1);
                }
            }
        }
        catch(SQLException ex){
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return id;
    }
     
    
    public int validarUsuario(int userId, String password){
        int rol = -1;
        String sql = "SELECT Rol_idRol FROM Usuarios where (codigoPucp = ? and password = ?)";
        try(Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                 )
        {
            pstmt.setInt(1, userId);
            pstmt.setString(2, password);
            try (ResultSet rs = pstmt.executeQuery()) {
                while(rs.next())
                {
                    rol = rs.getInt(1);
                }
            }
        }
        catch(SQLException ex){
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rol;
    }
        
}
