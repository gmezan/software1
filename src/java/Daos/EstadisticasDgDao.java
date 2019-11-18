/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Beans.Actividad;
import Dtos.EstadisticaA;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Gustavo_Meza
 */
public class EstadisticasDgDao extends BaseDao {
    
    public ArrayList<EstadisticaA> estadisticaA(){
        
        ArrayList<EstadisticaA> estadisticas = new ArrayList<>();
        
        String sql = "select a.idActividad, a.nombreActividad, a.Descripcion, concat(u.nombre,' ',u.apellido), count(p.Participante_codigoPucp)\n" +
                    "from Participante_a_Evento p \n" +
                    "left join Evento e on (e.idEvento = p.Evento_idEvento)\n" +
                    "left join Actividad a on (a.idActividad = e.Actividad_idActividad)\n" +
                    "left join Usuarios u on (u.codigoPucp = a.delegado_codigoPucp)\n" +
                    "group by a.idActividad";
        
        try (Connection conn = this.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);){
            
            while(rs.next()){
                EstadisticaA a = new EstadisticaA();
                a.setIdActividad(rs.getInt(1));
                a.setNombreActividad(rs.getString(2));
                a.setDescripcion(rs.getString(3));
                a.setNombreDelegado(rs.getString(4));
                a.setCantidad(rs.getInt(5));
                estadisticas.add(a);
                
            }
        }
        catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return estadisticas;
    }
    
    public ArrayList<EstadisticaA> estadisticaP(){
        
        ArrayList<EstadisticaA> estadisticas = new ArrayList<>();
        
        String sql = "select a.idActividad, a.nombreActividad, a.Descripcion, concat(u.nombre,' ',u.apellido), count(p.Participante_codigoPucp)\n" +
                    "from Participante_a_Evento p \n" +
                    "left join Evento e on (e.idEvento = p.Evento_idEvento)\n" +
                    "left join Actividad a on (a.idActividad = e.Actividad_idActividad)\n" +
                    "left join Usuarios u on (u.codigoPucp = a.delegado_codigoPucp)\n" +
                    "group by a.idActividad";
        
        try (Connection conn = this.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);){
            
            while(rs.next()){
                EstadisticaA a = new EstadisticaA();
                a.setIdActividad(rs.getInt(1));
                a.setNombreActividad(rs.getString(2));
                a.setDescripcion(rs.getString(3));
                a.setNombreDelegado(rs.getString(4));
                a.setCantidad(rs.getInt(5));
                estadisticas.add(a);
                
            }
        }
        catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return estadisticas;
    }
    
    
    public ArrayList<EstadisticaA> estadisticaR(){
        
        ArrayList<EstadisticaA> estadisticas = new ArrayList<>();
        
        String sql = "select a.idActividad, a.nombreActividad, a.Descripcion, concat(u.nombre,' ',u.apellido), count(p.Participante_codigoPucp)\n" +
                    "from Participante_a_Evento p \n" +
                    "left join Evento e on (e.idEvento = p.Evento_idEvento)\n" +
                    "left join Actividad a on (a.idActividad = e.Actividad_idActividad)\n" +
                    "left join Usuarios u on (u.codigoPucp = a.delegado_codigoPucp)\n" +
                    "group by a.idActividad";
        
        try (Connection conn = this.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);){
            
            while(rs.next()){
                EstadisticaA a = new EstadisticaA();
                a.setIdActividad(rs.getInt(1));
                a.setNombreActividad(rs.getString(2));
                a.setDescripcion(rs.getString(3));
                a.setNombreDelegado(rs.getString(4));
                a.setCantidad(rs.getInt(5));
                estadisticas.add(a);
                
            }
        }
        catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return estadisticas;
    }
    
}
