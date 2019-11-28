/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Beans.Actividad;
import Beans.Evento;
import Servlets.EventoServlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Fernando
 */
public class EventoDao extends BaseDao {

    public ArrayList<Evento> listarEventos(int cod) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            System.err.println(ex);
        }

        String sql = "SELECT *\n"
                + "FROM Evento e, Actividad a \n"
                + "WHERE e.Actividad_idActividad=a.idActividad AND a.delegado_codigoPucp=?;";
        ArrayList<Evento> listaEventos = new ArrayList<>();

        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, cod);

            try (ResultSet rs = pstmt.executeQuery();) {
                /////////////esto igual es lo de siempre
                while (rs.next()) {

                    Evento eve = new Evento();

                    eve.setIdEvento(rs.getInt(1));
                    eve.setDescripcion(rs.getString(2));
                    eve.setLugar(rs.getString(3));
                    eve.setFecha(rs.getString(4));
                    eve.setHora(rs.getString(5));

                    Actividad act = new Actividad();
                    act.setDelegado_codigoPucp(rs.getInt(9));
                    act.setIdActividad(rs.getInt(7));
                    act.setNombreActividad(rs.getString(8));

                    eve.setAct(act);

                    listaEventos.add(eve);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(EventoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listaEventos;
    }

    public void crearEvento(String descripcion, String lugar, String fecha, String hora, int idActividad) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            System.err.println(ex);
        }

        try (Connection conn = this.getConnection();) {
            String sql = "INSERT INTO mydb.Evento "
                    + "(descripcion, lugar, fecha, hora, Actividad_idActividad)"
                    + "VALUES ( ?, ?, ?, ?, ?)";

            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, descripcion);
                pstmt.setString(2, lugar);
                pstmt.setString(3, fecha);
                pstmt.setString(4, hora);
                pstmt.setInt(5, idActividad);
                pstmt.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(EventoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarEvento(int eventoId, String descripcion, String lugar, String hora, String fecha) {
        String sql = "UPDATE Evento "
                + "SET descripcion = ?, lugar = ?, hora = ?, fecha = ?"
                + "WHERE idEvento = ?";
        
        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(5, eventoId);
            pstmt.setString(1, descripcion);
            pstmt.setString(2, lugar);
            pstmt.setString(3, hora);
            pstmt.setString(4, fecha);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EventoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarEvento(int id) {
        String sql = "DELETE from Evento where idEvento = ?";

        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(EventoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
