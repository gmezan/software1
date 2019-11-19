/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Labtel
 */
public class DonacionesDao extends BaseDao{
    
    public void agregarDonacion(int codigo){
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
}
