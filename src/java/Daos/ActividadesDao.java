/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Beans.Actividad;
import Beans.Usuario;
import java.sql.Connection;
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
        String sql = "select * from Actividad";
        
        try (Connection conn = this.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);){
            
            while(rs.next()){
                Actividad a = new Actividad();
                a.setIdActividad(rs.getInt(1));
                a.setNombreActividad(rs.getString(2));
                a.setDelegado_codigoPucp(rs.getInt(3));
                actividades.add(a);
                
            }
        }
        catch(SQLException ex){
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return actividades;
    }
    
    
    
    
}
