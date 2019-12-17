/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Beans.Donacion;
import Beans.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author USUARIO
 */
public class DonacionDao extends BaseDao {

    public void donar(int idUsuario, String monto) {
        try (Connection conn = this.getConnection();) {
            String sql = "INSERT INTO Donacion\n"
                    + "(monto, contribuyente_codigoPucp, fecha) \n"
                    + "VALUES ( ?, ?, now())";

            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, monto);
                pstmt.setInt(2, idUsuario);
                pstmt.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(EventoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Donacion> listarDonacion(int idUsuario) {

        ArrayList<Donacion> listaDonacion = new ArrayList<>();

        String sql = "SELECT * FROM Donacion "
                + "where contribuyente_codigoPucp = ?";

        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idUsuario);

            try (ResultSet rs = pstmt.executeQuery();) {
                while (rs.next()) {
                    Donacion d = new Donacion();
                    Usuario u = new Usuario();
                    u.setCodigoPucp(idUsuario);
                    d.setUsuario(u);

                    d.setId(rs.getInt(1));
                    d.setMonto(rs.getString(2));
                    d.setFecha(rs.getString(4));

                    listaDonacion.add(d);

                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listaDonacion;

    }
}
