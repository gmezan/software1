/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Beans.Actividad;
import Beans.Estado;
import Beans.PartiEvento;
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


import java.util.Properties;  
import javax.mail.*;  
import javax.mail.internet.*;   

/**
 *
 * @author GUSTAVO
 */
public class UsuarioDao extends BaseDao {

public static void sendCorreo(String from, String pass, String[] to, String subject, String body) {     
  
  //String host="smtp.gmail.com";  
  //final String user="sonoojaiswal@javatpoint.com";//change accordingly  
  //final String password="xxxxx";//change accordingly  
    
  //String to="sonoojaiswal1987@gmail.com";//change accordingly  
  
   //Get the session object  
   Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.length];

            // To get the array of addresses
            for( int i = 0; i < to.length; i++ ) {
                toAddress[i] = new InternetAddress(to[i]);
            }

       for (InternetAddress toAddres : toAddress) {
           message.addRecipient(Message.RecipientType.TO, toAddres);
       }

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
    
   
   
   
 }
    
    
    
    
    public ArrayList<Usuario> listarUsuario() {

        ArrayList<Usuario> usuario = new ArrayList<>();

        String sql = "SELECT u.codigoPucp, u.nombre, u.apellido, u.correoPucp, u.condicion, r.idRol,e.estado,r.nombre_rol,a.idActividad, a.nombreActividad  FROM Usuarios u\n"
                + "inner join Rol r on u.Rol_idRol = r.idRol\n"
                + "inner join EstadoUsuario e on e.idEstado = u.Estado_idEstado "
                + "left join Actividad a on u.codigoPucp = a.delegado_codigoPucp "
                + "where e.idEstado = 1";
        try (Connection conn = this.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);) {
            while (rs.next()) {
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

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usuario;
    }

    public ArrayList<Usuario> listarUsuarioNR() {
        ArrayList<Usuario> usuario = new ArrayList<>();

        String sql = "SELECT u.codigoPucp, u.nombre, u.apellido, u.correoPucp, u.condicion, r.nombre_rol, e.estado  FROM Usuarios u\n"
                + "inner join Rol r on u.Rol_idRol = r.idRol\n"
                + "inner join EstadoUsuario e on e.idEstado = u.Estado_idEstado where e.idEstado = 2";
        try (Connection conn = this.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);) {
            while (rs.next()) {
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
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return usuario;
    }

    public ArrayList<Usuario> listarUsuarioBaneado() {
        ArrayList<Usuario> usuario = new ArrayList<>();

        String sql = "SELECT u.codigoPucp, u.nombre, u.apellido, u.correoPucp, u.condicion, r.nombre_rol, e.estado  FROM Usuarios u\n"
                + "inner join Rol r on u.Rol_idRol = r.idRol\n"
                + "inner join EstadoUsuario e on e.idEstado = u.Estado_idEstado where e.idEstado = 3";
        try (Connection conn = this.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);) {
            while (rs.next()) {
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
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return usuario;
    }
    
    
    public void rechazarSolicitudEvento(int codigo, int idEvento) {
        String sql = "DELETE FROM Participante_a_Evento WHERE Participante_codigoPucp = ? AND Evento_idEvento = ?";

        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, codigo);
            pstmt.setInt(2, idEvento);
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public void cambiar_A_Barra(int codigo, int idEvento) {
        String sql = "UPDATE Participante_a_Evento SET EstadoEvento_idEstadoEvento = 1 WHERE Participante_codigoPucp = ? AND Evento_idEvento = ?;";

        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, codigo);
            pstmt.setInt(2, idEvento);
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public void cambiar_A_Equipo(int codigo, int idEvento) {
        String sql = "UPDATE Participante_a_Evento SET EstadoEvento_idEstadoEvento = 2 WHERE Participante_codigoPucp = ? AND Evento_idEvento = ?;";

        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, codigo);
            pstmt.setInt(2, idEvento);
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    
    //////////////////////////////////////////
    //////////////////////////////////////////
    public ArrayList<PartiEvento> listaUsuariosBarrsOEq(int codigo) {

        ArrayList<PartiEvento> partis = new ArrayList<>();

        String sql = "SELECT pae.Participante_codigoPucp, u.nombre, u.apellido, ee.estado, u.condicion, e.descripcion, e.idEvento, pae.observaciones  FROM Participante_a_Evento pae, Usuarios u, Evento e, EstadoEvento ee WHERE pae.Participante_codigoPucp = u.codigoPucp AND e.idEvento = pae.Evento_idEvento AND pae.EstadoEvento_idEstadoEvento = ee.idEstadoEvento AND ee.idEstadoEvento <> 3 AND e.Actividad_idActividad = ?;";
        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, codigo);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                PartiEvento partiEvento = new PartiEvento();

                partiEvento.setCodigo(rs.getInt(1));
                partiEvento.setNombre(rs.getString(2));
                partiEvento.setApellido(rs.getString(3));
                partiEvento.setTipoApoyo(rs.getString(4));
                partiEvento.setCondicion(rs.getString(5));
                partiEvento.setEvento(rs.getString(6));
                partiEvento.setIdEvento(rs.getInt(7));

                partis.add(partiEvento);

            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return partis;

    }
    
    

    public ArrayList<PartiEvento> listaUsuariosEnEsperaEventos(int codigo) {

        ArrayList<PartiEvento> partis = new ArrayList<>();

        String sql = "SELECT pae.Participante_codigoPucp, u.nombre, u.apellido, ee.estado, u.condicion, e.descripcion, e.idEvento, pae.observaciones  FROM Participante_a_Evento pae, Usuarios u, Evento e, EstadoEvento ee WHERE pae.Participante_codigoPucp = u.codigoPucp AND e.idEvento = pae.Evento_idEvento AND pae.EstadoEvento_idEstadoEvento = ee.idEstadoEvento AND ee.idEstadoEvento = 3 AND e.Actividad_idActividad = ?";
        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, codigo);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                PartiEvento partiEvento = new PartiEvento();

                partiEvento.setCodigo(rs.getInt(1));
                partiEvento.setNombre(rs.getString(2));
                partiEvento.setApellido(rs.getString(3));
                partiEvento.setTipoApoyo(rs.getString(4));
                partiEvento.setCondicion(rs.getString(5));
                partiEvento.setEvento(rs.getString(6));
                partiEvento.setIdEvento(rs.getInt(7));

                partis.add(partiEvento);

            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return partis;

        /*
        
        

        ArrayList<PartiEvento> partis = new ArrayList<>();

        String sql = "SELECT p.Participante_codigoPucp, u.nombre, u.apellido, estEv.estado, u.condicion, e.descripcion , p.EstadoEvento_idEstadoEvento, p.observaciones, e.Actividad_idActividad, a.nombreActividad\n"
                + "FROM Participante_a_Evento p, Evento e, Usuarios u, Actividad a, EstadoEvento estEv\n"
                + "WHERE e.idEvento = p.Evento_idEvento AND p.EstadoEvento_idEstadoEvento = 3 AND u.codigoPucp = p.Participante_codigoPucp AND e.Actividad_idActividad = a.idActividad AND p.EstadoEvento_idEstadoEvento = estEv.idEstadoEvento;";

        try (Connection conn = this.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);) {
            while (rs.next()) {
                PartiEvento partiEvento = new PartiEvento();

                partiEvento.setCodigo(rs.getInt(1));
                partiEvento.setNombre(rs.getString(2));
                partiEvento.setApellido(rs.getString(3));
                partiEvento.setTipoApoyo(rs.getString(4));
                partiEvento.setCondicion(rs.getString(5));
                partiEvento.setEvento(rs.getString(6));

                partis.add(partiEvento);

            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return partis;
        
        
         */
    }

    public ArrayList<Usuario> listaUsuariosBarrsOEq2() {

        ArrayList<Usuario> usuario = new ArrayList<>();

        String sql = "SELECT * FROM Usuarios u\n"
                + "WHERE u.codigoPucp IN (SELECT DISTINCT(Participante_codigoPucp)\n"
                + "FROM mydb.Participante_a_Evento\n"
                + "WHERE EstadoEvento_idEstadoEvento = 1 OR EstadoEvento_idEstadoEvento = 2);";

        try (Connection conn = this.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);) {
            while (rs.next()) {
                Usuario u = new Usuario();

                u.setNombre(rs.getString(2));
                u.setCodigoPucp(rs.getInt(1));
                u.setApellido(rs.getString(3));
                u.setCondicion(rs.getString(6));
                u.setCorreoPucp(rs.getString(4));

                usuario.add(u);

            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usuario;

    }

    //////////////////////////////////////////////
    //////////////////////////////////////////////
    //////////////////////////////////////////////
    public ArrayList<Usuario> listarDA() {

        ArrayList<Usuario> usuario = new ArrayList<>();

        String sql = "SELECT u.codigoPucp, u.nombre, u.apellido, u.correoPucp, u.condicion, r.idRol,e.estado,r.nombre_rol,a.idActividad, a.nombreActividad  FROM Usuarios u\n"
                + "inner join Rol r on u.Rol_idRol = r.idRol\n"
                + "inner join EstadoUsuario e on e.idEstado = u.Estado_idEstado "
                + "left join Actividad a on u.codigoPucp = a.delegado_codigoPucp "
                + "where e.idEstado = 1 and r.idRol = 2";
        try (Connection conn = this.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);) {
            while (rs.next()) {
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

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return usuario;
    }

    public void borrarUsuario(int codigo) {
        String sql = "delete from Usuarios where codigoPucp = ?";

        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, codigo);
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void agregarUsuario(Usuario u) {
        String sql = "insert into Usuarios (codigoPucp, nombre, apellido, correoPucp, password, condicion, Rol_idRol, Estado_idEstado)"
                + " values(?,?,?,?,?,?,'1','2')";

        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, u.getCodigoPucp());
            pstmt.setString(2, u.getNombre());
            pstmt.setString(3, u.getApellido());
            pstmt.setString(4, u.getCorreoPucp());
            pstmt.setString(5, u.getPassword());
            pstmt.setString(6, u.getCondicion());
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void registrarUsuario(int codigoPucp) {
        String sql = "update Usuarios set Estado_idEstado = 1 where (codigoPucp = ?)";

        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, codigoPucp);
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void banearUsuario(int codigo) {
        String sql = "update Usuarios set Estado_idEstado = 3 where (codigoPucp = ?)";

        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, codigo);
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public HashMap<Integer, String> listarActividad() {
        HashMap<Integer, String> dict = new HashMap<>();

        String sql = "SELECT idActividad, nombreActividad FROM Actividad where delegado_codigoPucp is null";

        try (Connection conn = this.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);) {
            while (rs.next()) {
                dict.put(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return dict;
    }

    public HashMap<Integer, String> listarTodasActividades() {
        HashMap<Integer, String> dict = new HashMap<>();

        String sql = "SELECT idActividad, nombreActividad FROM Actividad";

        try (Connection conn = this.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);) {
            while (rs.next()) {
                dict.put(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return dict;

    }

    public void actualizarUsuario(int userId, boolean check, int actId) {
        if (check) {
            String sql = "update Usuarios set Rol_idRol = 2 where (codigoPucp = ?)";
            String sql2 = "update Actividad set delegado_codigoPucp = ? where (idActividad = ?)";
            String sql3 = "update Actividad set delegado_codigoPucp = NULL where (delegado_codigoPucp = ?)";
            try (Connection conn = this.getConnection();
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                    PreparedStatement pstmt2 = conn.prepareStatement(sql2);
                    PreparedStatement pstmt3 = conn.prepareStatement(sql3);) {
                pstmt.setInt(1, userId);
                pstmt.executeUpdate();
                pstmt2.setInt(1, userId);
                pstmt2.setInt(2, actId);

                pstmt3.setInt(1, userId);
                pstmt3.executeUpdate();
                pstmt2.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {

            String sql = "update Usuarios set Rol_idRol = 1 where codigoPucp = ?";

            String sql2 = "update Actividad set delegado_codigoPucp = NULL where idActividad = ?";

            try (Connection conn = this.getConnection();
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                    PreparedStatement pstmt2 = conn.prepareStatement(sql2);) {
                pstmt.setInt(1, userId);
                pstmt.executeUpdate();
                actId = actividadDeDelegado(userId);
                if (actId != 0) {
                    pstmt2.setInt(1, actId);
                    pstmt2.executeUpdate();
                }

            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

    public int actividadDeDelegado(int userId) {
        String sql = "SELECT idActividad FROM Actividad where delegado_codigoPucp = ?";
        int id = 0;
        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    id = rs.getInt(1);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return id;
    }

    public Usuario validarUsuario(int userId, String password) {
        Usuario u = null;
        String sql = "SELECT u.codigoPucp, u.nombre, u.apellido, u.correoPucp, u.condicion, r.idRol,e.estado,r.nombre_rol,a.idActividad, a.nombreActividad  FROM Usuarios u\n"
                + "inner join Rol r on u.Rol_idRol = r.idRol\n"
                + "inner join EstadoUsuario e on e.idEstado = u.Estado_idEstado "
                + "left join Actividad a on u.codigoPucp = a.delegado_codigoPucp "
                + "where e.idEstado = 1 and (codigoPucp = ? and password = ?)";
        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, userId);
            pstmt.setString(2, password);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    u = new Usuario();
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
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return u;
    }

    public ArrayList<Integer> dataDashboard() {
        ArrayList<Integer> data = new ArrayList<>();

        String sqlSolicitudes = "select count(codigoPucp) from Usuarios where Estado_idEstado = 2";
        String sqlDonacionHoy = "SELECT sum(monto) from Donacion where date(now()) = fecha ";
        String sqlDonacionTotal = "SELECT sum(monto) FROM Donacion";
        String sqlActividadesConDelegado = "select floor( 100*(SELECT count(delegado_codigoPucp) FROM Actividad where delegado_codigoPucp is not null)/(SELECT count(*) FROM Actividad ))";
        try (Connection con = this.getConnection();
                Statement stmt1 = con.createStatement();
                Statement stmt2 = con.createStatement();
                Statement stmt3 = con.createStatement();
                Statement stmt4 = con.createStatement();
                ResultSet rs1 = stmt1.executeQuery(sqlSolicitudes);
                ResultSet rs2 = stmt2.executeQuery(sqlDonacionHoy);
                ResultSet rs3 = stmt3.executeQuery(sqlDonacionTotal);
                ResultSet rs4 = stmt4.executeQuery(sqlActividadesConDelegado);) {

            if (rs1.next()) {
                data.add(rs1.getInt(1));
            } else {
                data.add(0);
            }
            if (rs2.next()) {
                data.add(rs2.getInt(1));
            } else {
                data.add(0);
            }
            if (rs3.next()) {
                data.add(rs3.getInt(1));
            } else {
                data.add(0);
            }
            if (rs4.next()) {
                data.add(rs4.getInt(1));
            } else {
                data.add(0);
            }
            //data.add(0);
            //data.add(1);
            //data.add(2);
            //data.add(3);

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return data;
    }

}
