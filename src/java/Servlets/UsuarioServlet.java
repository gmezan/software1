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
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GUSTAVO
 */
@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet","/EstadisticasDgServlet","/ActividadDgServlet"})
public class UsuarioServlet extends HttpServlet {

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
        String action = request.getParameter("action") == null ? "dashboard" : request.getParameter("action");
        
        UsuarioDao uDao = new UsuarioDao();
        EstadisticasDgDao e = new EstadisticasDgDao();
        ActividadesDao actividadesDao = new ActividadesDao();
        RequestDispatcher view;
        
        switch(action){
            case "listaUsuario":
                request.setAttribute("listaUsuario", uDao.listarUsuario());
                request.setAttribute("listaActividad", uDao.listarActividad());
                request.setAttribute("listaTodasActividades", uDao.listarTodasActividades());
                view = request.getRequestDispatcher("/DG/peopleR.jsp");
                view.forward(request, response);
                break;
                
            case "listaNR":
                request.setAttribute("listaNR", uDao.listarUsuarioNR());
                view = request.getRequestDispatcher("/DG/peopleNR.jsp");
                view.forward(request, response);
                break;
            
            case "listaBan":
                request.setAttribute("listaBan", uDao.listarUsuarioBaneado());
                view = request.getRequestDispatcher("/DG/Ban.jsp");
                view.forward(request, response);
                break;
            case "listaDA":
                request.setAttribute("listaDA", uDao.listarDA());
                request.setAttribute("listaActividad", uDao.listarActividad());
                request.setAttribute("listaTodasActividades", uDao.listarTodasActividades());
                view = request.getRequestDispatcher("/DG/peopleDA.jsp");
                view.forward(request, response);
                break;
                
            case "actualizar": 
                boolean checkbox;
                try{
                    checkbox = Boolean.parseBoolean(request.getParameterValues("EditModalCheckboxDA")[0]) ;
                }catch(NullPointerException ex){
                    checkbox = false;
                }
                int idUsuario = Integer.parseInt(request.getParameter("codigoPucpUsuario"));
                int idActividad = 0;
                if(checkbox){
                    idActividad = Integer.parseInt(request.getParameterValues("actividadEscogida")[0]);}
                uDao.actualizarUsuario(idUsuario, checkbox, idActividad);
                response.sendRedirect("UsuarioServlet?action=listaUsuario");
                
                break;
            
            case "borrar":
                uDao.borrarUsuario(Integer.parseInt(request.getParameter("codigoPucpUsuarioBorrar")));
                response.sendRedirect("UsuarioServlet?action=listaUsuario");
                break;
                
            case "dashboard":
                
                view = request.getRequestDispatcher("/DG/indexDG.jsp");
                view.forward(request, response);
                break;
                
            case "agregar":
                uDao.agregarUsuario(Integer.parseInt(request.getParameter("codigoPucpUsuarioAgregar")));
                response.sendRedirect("UsuarioServlet?action=listaUsuario");
                break;
                
            case "banear":
                uDao.banearUsuario(Integer.parseInt(request.getParameter("codigoPucpUsuarioBanear")));
                response.sendRedirect("UsuarioServlet?action=listaUsuario");
                break;
                
                
            //Parte de estadisticas  
                
                
            case "estadisticaApoyos":
                request.setAttribute("estadisticas", e.estadisticaA());
                view = request.getRequestDispatcher("/DG/statisticsA.jsp");
                view.forward(request, response);
                break;
                
            case "estadisticaRecaudaciones":
                request.setAttribute("estadisticas", e.estadisticaR());
                view = request.getRequestDispatcher("/DG/statisticsR.jsp");
                view.forward(request, response);
                break;
                
            case "estadisticaPersonas":
                request.setAttribute("estadisticas", e.estadisticaP());
                view = request.getRequestDispatcher("/DG/statisticsP.jsp");
                view.forward(request, response);
                break;
            
            //Parte de actividades:
                
            case "listaActividades":
                request.setAttribute("listaActividades", actividadesDao.listarActividades());
                view = request.getRequestDispatcher("/DG/activities.jsp");
                view.forward(request, response);
                break;
               
            case "guardarActividad":
                                
                String descripcionNuevo = request.getParameter("descripcionActividadNuevo");
                String nombreNuevo = request.getParameter("nombreActividadNuevo");
                actividadesDao.nuevaActividad(nombreNuevo,descripcionNuevo);
                response.sendRedirect("ActividadDgServlet?action=listaActividades");
                break;
                
            case "actualizarActividad":

                String descripcion = request.getParameter("descripcionActividad");
                String nombre = request.getParameter("nombreActividad");
                actividadesDao.actualizarActividad(nombre, descripcion, Integer.parseInt(request.getParameter("actividadId")));
                response.sendRedirect("ActividadDgServlet?action=listaActividades");
                break;
                
            case "borrarActividad":
                actividadesDao.borrarActividad(Integer.parseInt(request.getParameter("actividadIdBorrar")));
                response.sendRedirect("ActividadDgServlet?action=listaActividades");
                break;  
                
                
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
