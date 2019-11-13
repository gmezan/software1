/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Daos.ActividadesDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Beans.Actividad;
import java.io.InputStream;
import java.nio.file.Paths;
import javax.servlet.http.Part;
/**
 *
 * @author GUSTAVO
 */
@WebServlet(name = "ActividadServlet", urlPatterns = {"/ActividadServlet"})
public class ActividadServlet extends HttpServlet {

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
        RequestDispatcher view = null;
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        
        ActividadesDao actividadesDao = new ActividadesDao();
        
        switch(action){
            
            case "listaActividades":
                request.setAttribute("listaActividades", actividadesDao.listarActividades());
                view = request.getRequestDispatcher("/DG/activities.jsp");
                view.forward(request, response);
                break;
                
                
            case "guardar":
                                
                String descripcionNuevo = request.getParameter("descripcionActividadNuevo");
                String nombreNuevo = request.getParameter("nombreActividadNuevo");
                actividadesDao.nuevaActividad(nombreNuevo,descripcionNuevo);
                response.sendRedirect("ActividadServlet?action=listaActividades");
                
                /*
                Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
                InputStream fileContent = filePart.getInputStream();
                    InputStream initialStream = new FileInputStream(
                new File("src/main/resources/sample.txt"));
              byte[] buffer = new byte[initialStream.available()];
              initialStream.read(buffer);

              File targetFile = new File("src/main/resources/targetFile.tmp");
              OutputStream outStream = new FileOutputStream(targetFile);
              outStream.write(buffer);*/
                break;
                
            case "actualizar":

                String descripcion = request.getParameter("descripcionActividad");
                String nombre = request.getParameter("nombreActividad");
                int idActividad = Integer.parseInt(request.getParameter("actividadId"));
                actividadesDao.actualizarActividad(nombre, descripcion, idActividad);
                response.sendRedirect("ActividadServlet?action=listaActividades");
                break;
                
            case "borrar":
                actividadesDao.borrarActividad(Integer.parseInt(request.getParameter("actividadIdBorrar")));
                response.sendRedirect("ActividadServlet?action=listaActividades");
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
