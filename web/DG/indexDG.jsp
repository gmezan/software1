<%-- 
    Document   : indexdg
    Created on : 10/11/2019, 07:24:58 PM
    Author     : GUSTAVO
--%>

<%@page import="Dtos.EstadisticaR"%>
<%@page import="Dtos.EstadisticasP"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Beans.Usuario"%>
<jsp:useBean id="usuario" type="Usuario" scope="session" />
<% ArrayList<Integer> lista = (ArrayList<Integer>) request.getAttribute("datos"); %>
<% ArrayList<EstadisticasP> listaP = (ArrayList<EstadisticasP>) request.getAttribute("estadisticasP"); %>
<% ArrayList<EstadisticaR> listaR = (ArrayList<EstadisticaR>) request.getAttribute("estadisticasR"); %>


<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath()%>/https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<%=request.getContextPath()%>/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">
    
    <%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    %>

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gray-900 sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath()%>/UsuarioServlet?action=dashboard">
        <div class="sidebar-brand-icon ">
          <i class="fas fa-broadcast-tower"></i>
        </div>
        <div class="sidebar-brand-text mx-3" style="font-size: 18px">Semana de ingeniería</div>
      </a>

      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath()%>/UsuarioServlet?action=dashboard">

        <div class="sidebar-brand-text mx-3" style="font-size: 13px; font-family: Arial">Delegado General</div>
      </a>
      <!-- Divider -->

      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="<%=request.getContextPath()%>/UsuarioServlet?action=dashboard">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>


      <!-- Modificacion -->
      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        funciones
      </div>

      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/ActividadDgServlet?action=listaActividades">
          <i class="fas fa-fw fa-running"></i> <!--icono!!!!!-->
          <span>Actividades</span></a>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePers" aria-expanded="true" aria-controls="collapsePers">
          <i class="fas fa-fw fa-user-friends"></i>
          <span>Personas</span>
        </a>
        <div id="collapsePers" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="<%=request.getContextPath()%>/UsuarioServlet?action=listaUsuario">Personas registradas</a>
                    <a class="collapse-item" href="<%=request.getContextPath()%>/UsuarioServlet?action=listaNR">Personas no registradas</a>
                    <a class="collapse-item " href="<%=request.getContextPath()%>/UsuarioServlet?action=listaBan">Personas baneadas</a>
                    <h6 class="collapse-header">Otro:</h6>
                    <a class="collapse-item " href="<%=request.getContextPath()%>/UsuarioServlet?action=listaDA">Delegados de actividad</a>

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
                    <a class="collapse-item" href="<%=request.getContextPath()%>/EstadisticasDgServlet?action=estadisticaApoyos">Cantidad de apoyos</a>
                    <a class="collapse-item" href="<%=request.getContextPath()%>/EstadisticasDgServlet?action=estadisticaRecaudaciones">Recaudaciones</a>
                    <a class="collapse-item" href="<%=request.getContextPath()%>/EstadisticasDgServlet?action=estadisticaPersonas">Alumnos y egresados</a>
          </div>
        </div>
      </li>

      <!-- Divider
      <hr class="sidebar-divider">
      <div class="sidebar-heading">
        sistema
      </div>


      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Login Screens:</h6>
            <a class="collapse-item" href="../index.html">Login</a>
            <a class="collapse-item" href="../register.html">Register</a>
            <a class="collapse-item" href="../forgot-password.html">Forgot Password</a>
            <h6 class="collapse-header">Other Pages:</h6>
            <a class="collapse-item" href="404.html">404 Page</a>

          </div>
        </div>
      </li>-->

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
                <img class="img-profile rounded-circle" src="https://placekitten.com/60/60">
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

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            <!--
            <a href="#" class="d-none d-sm-inline-block btn btn-sm bg-gray-900 shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
            -->
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Recaudado hoy</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">S/. <%=lista.get(1)%></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total recaudado</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">S/. <%=lista.get(2)%></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Actividades con delegado</div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><%=lista.get(3)%>%</div>
                        </div>
                        <div class="col">
                          <div class="progress progress-sm mr-2">
                            <div class="progress-bar bg-info" role="progressbar" style="width: <%=lista.get(3)%>%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Solicitudes pendientes</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><%=lista.get(0)%></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Recaudaciones</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Opciones:</div>
                      <a class="dropdown-item" href="statisticsR.html">Estadísticas de recaudaciones</a>

                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="myAreaChart"></canvas>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Total de participantes</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Opciones:</div>
                      <a class="dropdown-item" href="statisticsP.html">Estadísticas a detalle</a>
                      <a class="dropdown-item" href="peopleR.html">Información de participantes</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="peopleNR.html">Solicitudes pendientes</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-pie pt-4 pb-2">
                    <canvas id="myPieChart"></canvas>
                  </div>
                  <div class="mt-4 text-center small">
                      <span class="mr-2">
                      <i class="fas fa-circle text-info"></i> Egresados
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-success"></i> Alumnos
                    </span>

                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Content Column -->
            <div class="col-lg-6 mb-4">

               <!--Projt Card Example-->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Egresados que cumplieron la cuota mínima</h6>
                </div>
                <div class="card-body">

                  <h4 class="small font-weight-bold">Egresados <span class="float-right">60%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>


                </div>
              </div>

              <!-- Color System
              <div class="row">
                <div class="col-lg-6 mb-4">
                  <div class="card bg-primary text-white shadow">
                    <div class="card-body">
                      Primary
                      <div class="text-white-50 small">#4e73df</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-success text-white shadow">
                    <div class="card-body">
                      Success
                      <div class="text-white-50 small">#1cc88a</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-info text-white shadow">
                    <div class="card-body">
                      Info
                      <div class="text-white-50 small">#36b9cc</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-warning text-white shadow">
                    <div class="card-body">
                      Warning
                      <div class="text-white-50 small">#f6c23e</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-danger text-white shadow">
                    <div class="card-body">
                      Danger
                      <div class="text-white-50 small">#e74a3b</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-secondary text-white shadow">
                    <div class="card-body">
                      Secondary
                      <div class="text-white-50 small">#858796</div>
                    </div>
                  </div>
                </div>
              </div>-->

            </div>
           
            
            
            <table id="TablaRecaudaciones" style="display: none" >
                  <thead>
                    <tr>
                      <th>Nombre</th>
                      
                      <th>Donación (S/.)</th>

                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>Nombre</th>
                      
                      <th>Donación (S/.)</th>
                    </tr>
                  </tfoot>
                  <tbody >
                  <% for(EstadisticaR e : listaR){
                              %>    
                      
                    <tr>
                      <td><%=e.getDate().toString()%></td>
                      <td><%=e.getCantidad()%></td>
                      

                    </tr>
                    
                    <%
                        }
                        
                        %>
                    
                    
                  </tbody>
                </table>
                        
                        
            <table id="TablaPersonas" style="display: none">
                  <thead>
                  <tr>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Condición</th>

                  </tr>
                  </thead>
                  <tfoot>
                  <tr>
                      <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Condición</th>
                  </tr>
                  </tfoot>
                  <tbody>
                    <% for(EstadisticasP e : listaP){
                              %>  
                      
                  <tr>
                    <td><%=e.getCondicion()%></td>
                    
                  </tr>
                  <%
                        }
                        
                        %>
                  
                 
                  </tbody>
                </table>
            
            

            <div class="col-lg-6 mb-4">

              <!-- Illustrations -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Movilidad</h6>
                </div>
                <div class="card-body">
                  <div class="text-center">
                    <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="<%=request.getContextPath()%>/img/undraw_posting_photo.svg" alt="">
                  </div>
                  <p> Puedes ingresar a esta página desde cualquier dispositivo y asegurarte de que todo vaya en orden en esta semana de ingeniería.</p>
                  <a target="_blank" rel="nofollow" href="https://blog.telecom.pucp.edu.pe/">Blog telecom &rarr;</a>
                </div>
              </div>

              <!-- Approach -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Development Approach</h6>
                </div>
                <div class="card-body">
                  <p>Esta página se desarrollo usando Bootstrap 4.</p>
                  <p class="mb-0"></p>
                </div>
              </div>

            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

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
  <script src="<%=request.getContextPath()%>/DG/js/personasTabla.js"></script>
  <script src="<%=request.getContextPath()%>/DG/js/recaudacionesTiempo.js"></script>

</body>

</html>
