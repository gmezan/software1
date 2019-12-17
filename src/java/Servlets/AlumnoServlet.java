/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Usuario;
import Daos.EventosAluDao;
import Daos.InscripcionEventoDao;
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
 * @author Labtel
 */
@WebServlet(name = "AlumnoServlet", urlPatterns = {"/AlumnoServlet","/AL"})
public class AlumnoServlet extends HttpServlet {

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
        RequestDispatcher view;
        HttpSession session = request.getSession();
        EventosAluDao EvAlDao = new EventosAluDao();
        
//        InscripcionEventoDao InEvDao = new InscripcionEventoDao();
        if (session.getAttribute("usuario")==null) {
            response.sendRedirect(request.getContextPath());
        } else {

            switch (action) {
                case "listaEventos":
                    Usuario us = (Usuario) session.getAttribute("usuario");
                    request.setAttribute("listaEventosParticipando", EvAlDao.listarEventosPart(us.getCodigoPucp()));
                    request.setAttribute("listaEventosNoRegistrado", EvAlDao.listarEventosNoRegistrado(us.getCodigoPucp()));
                    view = request.getRequestDispatcher("/AL/misEventos.jsp");
                    view.forward(request, response);
                    break;
                case "donaciones":
                    
                    break;
                case "main":
                    view = request.getRequestDispatcher("/AL/indexA.jsp");
                    view.forward(request, response);
                    break;
                    
                case "inscribirse":
//                    String descripcionNuevo = request.getParameter("descripcionActividadNuevo");
//                    String nombreNuevo = request.getParameter("nombreActividadNuevo");
//                    InEvDao.inscribirseAlEvento(nombreNuevo, descripcionNuevo);
                    response.sendRedirect("ActividadDgServlet?action=listaActividades");
                    break;
                case "agregarDonacion":
//                    uDao.agregarUsuario(Integer.parseInt(request.getParameter("codigoPucpUsuarioAgregar")));
                    response.sendRedirect("UsuarioServlet?action=listaUsuario");
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
