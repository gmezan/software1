/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Beans.Actividad;
import Beans.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Statement;
import java.util.ArrayList;
/**
 *
 * @author GUSTAVO
 */
public class ActividadesDao extends BaseDao{
    
    public ArrayList<Actividad> listarActividades(){
        ArrayList<Actividad> actividades = new ArrayList<>();
        String sql = "select a.*, concat(u.nombre,' ',u.apellido) from Actividad a left join Usuarios u on (u.codigoPucp = a.delegado_codigoPucp)";
        
        try (Connection conn = this.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);){
            
            while(rs.next()){
                Actividad a = new Actividad();
                a.setIdActividad(rs.getInt(1));
                a.setNombreActividad(rs.getString(2));
                a.setDelegado_codigoPucp(rs.getInt(3));
                a.setDescripcion(rs.getString(4));
                a.setNombreDelegado(rs.getString(5));
                actividades.add(a);
                
            }
        }
        catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return actividades;
    }
    
    
    public void nuevaActividad(String nombre, String descripcion){
        String sql = "insert into Actividad (nombreActividad, Descripcion) values (?,?) ";
        
        
        try(Connection conn = this.getConnection();
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                     )
            {
                pstmt.setString(1, nombre);
                pstmt.setString(2, descripcion);
                pstmt.executeUpdate();

            }
            catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        
    }
    
    
     public void borrarActividad(int id){
        String sql = "delete from Actividad where idActividad = ?";
        
        try(Connection conn = this.getConnection();
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                     )
            {
                pstmt.setInt(1, id);
                pstmt.executeUpdate();

            }
            catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        
        
    }
     
    public void actualizarActividad(String nombre, String descripcion, int id){
        
        String sql = "update Actividad set nombreActividad = ?, Descripcion = ? where (idActividad = ?)";
        
        try(Connection conn = this.getConnection();
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                     )
            {
                pstmt.setInt(3, id);
                pstmt.setString(1, nombre);
                pstmt.setString(2, descripcion);
                pstmt.executeUpdate();

            }
            catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        
    }
    
    
}
