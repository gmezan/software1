/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Usuario;
import Daos.ActividadesDao;
import Daos.EstadisticasDgDao;
import Daos.UsuarioDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Fernando
 */
@WebServlet(name = "DAServlet", urlPatterns = {"/DA"})
public class DAServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action") == null ? "main" : request.getParameter("action");

        UsuarioDao uDao = new UsuarioDao();
        EstadisticasDgDao e = new EstadisticasDgDao();
        ActividadesDao actividadesDao = new ActividadesDao();
        RequestDispatcher view;
        HttpSession session = request.getSession();

        if (session.getAttribute("usuario") == null) {

            response.sendRedirect(request.getContextPath());
        } else {
            switch (action) {

                ////////////////////////////////////////
                case "main":
                    view = request.getRequestDispatcher("/DA/indexDA.jsp");
                    view.forward(request, response);
                    break;

                case "listarEsperas":
                    Usuario user1 = (Usuario) session.getAttribute("usuario");
                    request.setAttribute("listaUsuariosEspera", uDao.listaUsuariosEnEsperaEventos(user1.getIdActividad()));
                    view = request.getRequestDispatcher("/DA/peopleNR.jsp");
                    view.forward(request, response);
                    break;

                case "rechazarSolicitud":

                    int idUsuario1 = Integer.parseInt(request.getParameter("idUsuario"));
                    int idEvento1 = Integer.parseInt(request.getParameter("idEvento"));
                    uDao.rechazarSolicitudEvento(idUsuario1, idEvento1);
                    response.sendRedirect("DA?action=listarEsperas");

                    break;

                case "borrarBarraoEquipo":
                    int idUsuario2 = Integer.parseInt(request.getParameter("idUsuario"));
                    int idEvento2 = Integer.parseInt(request.getParameter("idEvento"));
                    uDao.rechazarSolicitudEvento(idUsuario2, idEvento2);
                    response.sendRedirect("DA?action=listarBarrEq");
                    break;

                case "designarBarra":
                    int idUsuario5 = Integer.parseInt(request.getParameter("idUsuario"));
                    int idEvento5 = Integer.parseInt(request.getParameter("idEvento"));
                    uDao.cambiar_A_Barra(idUsuario5, idEvento5);
                    response.sendRedirect("DA?action=listarEsperas");
                    break;
                    
                case "desginarEquipo":
                    int idUsuario4 = Integer.parseInt(request.getParameter("idUsuario"));
                    int idEvento4 = Integer.parseInt(request.getParameter("idEvento"));
                    uDao.cambiar_A_Barra(idUsuario4, idEvento4);
                    response.sendRedirect("DA?action=listarEsperas");
                    break;
                    
                case "cambiarTipoApoyo":
                    String tipoApoyo = request.getParameter("tipoApoyo");
                    int idUsuario3 = Integer.parseInt(request.getParameter("idUsuario"));
                    int idEvento3 = Integer.parseInt(request.getParameter("idEvento"));
                    
                    if(tipoApoyo.equalsIgnoreCase("barra")){
                        uDao.cambiar_A_Equipo(idUsuario3, idEvento3);
                    }
                    if(tipoApoyo.equalsIgnoreCase("equipo")){
                        uDao.cambiar_A_Barra(idUsuario3, idEvento3);
                    }
                    
                    response.sendRedirect("DA?action=listarBarrEq");
                    
                    break;

                case "listarBarrEq":
                    Usuario user2 = (Usuario) session.getAttribute("usuario");
                    request.setAttribute("listaUsuariosBarrsOEq", uDao.listaUsuariosBarrsOEq(user2.getIdActividad()));
                    view = request.getRequestDispatcher("/DA/revisarParticipantes.jsp");
                    view.forward(request, response);
                    break;

                case "listarEstadisticas":

                    Usuario user3 = (Usuario) session.getAttribute("usuario");
                    request.setAttribute("listaUsuariosDistintos", uDao.participantesDistintos(user3.getIdActividad()));
                    view = request.getRequestDispatcher("/DA/statisticsA.jsp");
                    view.forward(request, response);
                    break;

            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
