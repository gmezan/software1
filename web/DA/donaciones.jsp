<%-- 
    Document   : donaciones
    Created on : 16-nov-2019, 17:11:31
    Author     : Labtel
--%>

<%@page import="Beans.Donacion"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Beans.Usuario"%>
<jsp:useBean id="usuario" type="Usuario" scope="session" />
<% ArrayList<Donacion> listaDon = (ArrayList<Donacion>) request.getAttribute("listaDonacion");%>




<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Donaciones</title>

        <!-- Custom fonts for this template-->
        <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="<%=request.getContextPath()%>/css/sb-admin-2.min.css" rel="stylesheet">

    </head>
    <body id="page-top">
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        %>

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gray-900 sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath()%>/AlumnoServlet">
                    <div class="sidebar-brand-icon ">
                        <i class="fas fa-broadcast-tower"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3" style="font-size: 18px">Semana de ingeniería</div>
                </a>

                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath()%>/AlumnoServlet">

                    <div class="sidebar-brand-text mx-3" style="font-size: 13px; font-family: Arial">Alumno</div>
                </a>
                <!-- Divider -->

                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/DA?action=main">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Menú Principal</span></a>
                </li>

                <hr class="sidebar-divider">

                <div class="sidebar-heading">
                    Funciones
                </div>
                
                <li class="nav-item ">
                    <a class="nav-link" href="<%=request.getContextPath()%>/EventoServlet?action=listaEventosParaInscribirse">
                        <i class="fas fa-fw fa-running"></i> <!--icono!!!!!-->
                        <span>Eventos para inscribirse</span></a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/EventoServlet?action=listaEventos">
                        <i class="fas fa-fw fa-running"></i> <!--icono!!!!!-->
                        <span>Mis eventos</span></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/EventoServlet?action=listar">
                        <i class="fas fa-fw fa-running"></i>
                        <span>Eventos de <%= usuario.getActividad().getNombreActividad()%></span></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePers" aria-expanded="true" aria-controls="collapsePers">
                        <i class="fas fa-fw fa-user-friends"></i>
                        <span>Personas</span>
                    </a>
                    <div id="collapsePers" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="<%=request.getContextPath()%>/DA?action=listarEsperas">Personas no registradas</a>
                            <a class="collapse-item" href="<%=request.getContextPath()%>/DA?action=listarBarrEq">Revisar participantes</a>
                        </div>
                    </div>
                </li>

                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseEstd" aria-expanded="true" aria-controls="collapseEstd">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Estadísticas</span>
                    </a>
                    <div id="collapseEstd" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Todas las estadísticas</h6>
                            <a class="collapse-item" href="<%=request.getContextPath()%>/DA?action=listarEstadisticas">Cantidad de apoyos</a>
                        </div>
                    </div>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="<%=request.getContextPath()%>/DAServlet?action=donacionesDA">
                        <i class="fas fa-fw fa-dollar-sign"></i>
                        <span>Donaciones</span>
                    </a>
                </li>
                
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Search -->
                        <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <!--
                            <div class="input-group">
                              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                              <div class="input-group-append">
                                <button class="btn btn-dark" type="button">
                                  <i class="fas fa-search fa-sm"></i>
                                </button>
                              </div>
                            </div>
        
                            -->
                        </form>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-dark" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>

                            <!-- Nav Item - Messages deleted-->


                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=usuario.getNombre()%> <%=usuario.getApellido()%></span>
                                    <img class="img-profile rounded-circle" src="<%=request.getContextPath()%>/DA/imgDA/perfil.jpg">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">

                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Cerrar sesión
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- CONTENIDO -->

                    <div class="container">

                        <!-- Portfolio Item Heading -->
                        <h1 class="my-4">
                            ¡Apoya a Telito!
                        </h1>

                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                                <div class="card shadow ">
                                    <img src="<%=request.getContextPath()%>/images/telito.jpg" height="400" class="rounded" >
                                </div>
                            </div>
                            <div class="col-md-3"></div>
                        </div>
                        <br>

                        <br>

                        <form method="POST" action="DA?action=agregarDonacion">
                            <div class="row">
                                <div class="col-md-4"></div>

                                <div class="col-md-4">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">$</span>
                                        </div>
                                        <input required type="number" min="<%=usuario.getCondicion().equals("Egresado") ? "100" : "0"%>" name="monto" class="form-control" aria-label="Amount (to the nearest dollar)" autofocus>
                                        <div class="input-group-append">
                                            <span class="input-group-text">.00</span>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-md-4"></div>
                            </div>

                            <p align="center">Si eres egresado, el monto mínimo es de 100$.</p>

                            <div align="center">

                                <br>
                                <button type="submit" align="right" class="btn btn-outline-primary" s >Donar</button>

                            </div>
                        </form>    
                                        
                        <br>
                        <p>Acá podrás ver tus aportes a la Fibra.</p>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Tus donaciones</h6>
                            </div>

                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Monto</th>
                                                <th>Fecha</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <% int i = 1;
                                                for (Donacion d : listaDon) {

                                            %>
                                            <tr>
                                                <td><%=i%></td>
                                                <td><%=d.getMonto()%></td>
                                                <td><%=d.getFecha()%></td>
                                            </tr>

                                            <%
                                                    i++;
                                                }

                                            %>



                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>


                        <br>
                        <h1 align="center">¡Gracias por colaborar!</h2>

                            <br>
                            <br>

                            </div>
                            <!-- FIN DE CONTENIDO -->



                            </div>
                            <!-- End of Main Content -->

                            <!-- Footer -->


                            <footer class="sticky-footer bg-white">
                                <div class="container my-auto">
                                    <div class="copyright text-center my-auto">
                                        <span>Copyright &copy; Your Website 2019</span>
                                    </div>
                                </div>
                            </footer>
                            <!-- End of Footer -->

                    </div>
                    <!-- End of Content Wrapper -->

                </div>
                <!-- End of Page Wrapper -->

                <!-- Scroll to Top Button-->
                <a class="scroll-to-top rounded" href="#page-top">
                    <i class="fas fa-angle-up"></i>
                </a>

                <!-- Logout Modal-->
                <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Listo para salir?</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">Selecciona "Cerrar sesión" abajo si estás listo para cerrar tu sesión actual.</div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                                <a class="btn btn-primary" href="<%=request.getContextPath()%>/MainServlet?action=inicio">Cerrar sesión</a>
                            </div>
                        </div>
                    </div>
                </div>









                <!-- Bootstrap core JavaScript-->
                <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
                <script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

                <!-- Core plugin JavaScript-->
                <script src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>

                <!-- Custom scripts for all pages-->
                <script src="<%=request.getContextPath()%>/js/sb-admin-2.min.js"></script> <!--checked-->

                <!-- Page level plugins -->
                <script src="<%=request.getContextPath()%>/vendor/chart.js/Chart.min.js"></script>

                <!-- Page level custom scripts -->
                <script src="<%=request.getContextPath()%>/js/demo/chart-area-demo.js"></script>
                <script src="<%=request.getContextPath()%>/js/demo/chart-pie-demo.js"></script>

                </body>
                </html>
