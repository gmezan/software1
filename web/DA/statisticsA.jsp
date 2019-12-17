<%-- 
    Document   : statisticsA
    Created on : 12/11/2019, 01:08:35 AM
    Author     : GUSTAVO
--%>


<%@page import="Daos.UsuarioDao"%>
<%@page import="Beans.PartiEvento"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Beans.Usuario"%>
<jsp:useBean id="usuario" type="Usuario" scope="session" />
<% ArrayList<PartiEvento> listaBarrEq = (ArrayList<PartiEvento>) request.getAttribute("listaUsuariosBarrsOEq");%>


<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>DG - Estadísticas Apoyos</title>

  <!-- Custom fonts for this template -->
  <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath()%>/https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath()%>/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath()%>/DA?action=main">
        <div class="sidebar-brand-icon ">
          <i class="fas fa-broadcast-tower"></i>
        </div>
        <div class="sidebar-brand-text mx-3" style="font-size: 18px">Semana de ingeniería</div>
      </a>

      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath()%>/DA?action=main">

        <div class="sidebar-brand-text mx-3" style="font-size: 13px; font-family: Arial">Delegado de <%= usuario.getActividad().getNombreActividad()%></div>
      </a>
      <!-- Divider -->

      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/DA?action=main">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Menú Principal</span></a>
      </li>


      <!-- Modificacion -->
      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        funciones
      </div>

      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/EventoServlet?action=listar">
          <i class="fas fa-fw fa-running"></i> <!--icono!!!!!-->
          <span>Eventos</span></a>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePers" aria-expanded="true" aria-controls="collapsePers">
          <i class="fas fa-fw fa-user-friends"></i>
          <span>Personas</span>
        </a>
        <div id="collapsePers" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
              
              
              <a class="collapse-item active" href="<%=request.getContextPath()%>/DA?action=listarEsperas">Personas no registradas</a>
              <a class="collapse-item" href="<%=request.getContextPath()%>/DA?action=listarBarrEq">Revisar participantes</a>
              
            <!-- <a class="collapse-item" href="<%=request.getContextPath()%>/UsuarioServlet?action=listaUsuario">Personas registradas</a>
                    <a class="collapse-item" href="<%=request.getContextPath()%>/UsuarioServlet?action=listaNR">Personas no registradas</a>
                    <a class="collapse-item " href="<%=request.getContextPath()%>/UsuarioServlet?action=listaBan">Personas baneadas</a>
                    <h6 class="collapse-header">Otro:</h6>
                    <a class="collapse-item " href="<%=request.getContextPath()%>/UsuarioServlet?action=listaDA">Delegados de actividad</a>
            
            -->
          </div>
        </div>
      </li>

      <li class="nav-item active">
        <a class="nav-link " href="#" data-toggle="collapse" data-target="#collapseEstd" aria-expanded="true" aria-controls="collapseEstd">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Estadísticas</span>
        </a>
        <div id="collapseEstd" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Todas las estadísticas</h6>
            <a class="collapse-item" href="<%=request.getContextPath()%>/DA?action=listarEstadisticas">Cantidad de apoyos</a>
            
            
          </div>
        </div>
      </li>

      <br>


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
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>



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
          <h1 class="h3 mb-2 text-gray-800">Cantidad de apoyos</h1>
          <p class="mb-4">
            Acá se muestran la cantidad de personas que están apoyando una actividad.</p>

          <!-- Bar Chart -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Gráfico de barras</h6>
            </div>
            <div class="card-body">
              <div class="chart-bar">
                <canvas id="myBarChart"></canvas>
              </div>
              <hr>
              Se muestran todas las actividades registradas, para agregar o eliminar una actividad ingresar a <a target="_blank" href="activities.html">Actividades</a>.


            </div>
          </div>

          <!--
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Pie Chart</h6>
            </div>
            <div class="card-body">
              <div class="chart-pie pt-4">
                <canvas id="myPieChart"></canvas>
              </div>
              <hr>
              Se muestran todas las actividades registradas, para agregar o eliminar una actividad ingresar a <a target="_blank" href="activities.html">Actividades</a>.
            </div>
          </div>-->

          <!-- DataTales Example -->
          <div id="myTable" class="card shadow mb-4" >
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Tabla de datos</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Código de Alumno</th>
                      <th>Nombre y Apellido de Alumno</th>
                      <th>Condición</th>
                      <th>Imagen</th>
                      <th>Número de participantes</th>

                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>Código de Alumno</th>
                      <th>Nombre y Apellido de Alumno</th>
                      <th>Condición</th>
                      <th>Imagen</th>
                      <th>Número de participaciones</th>
                    </tr>
                  </tfoot>
                  <tbody>
                      
                      <% for(PartiEvento par : listaBarrEq){
                          UsuarioDao uDao = new UsuarioDao();
                              
                              
                              %>
                    <tr>
                      <td><%=par.getCodigo()%></td>
                      <td><%=par.getNombre()%> <%=par.getApellido()%></td>
                      <td>XXXXXX</td>
                      <td><img src="https://raw.githubusercontent.com/gmn14/webpage/master/images/semana.jpg" height="100px" width="100px" class="img-fluid" alt="Responsive image">
                      </td>
                      <td><%=uDao.contarParticipaciones(par.getCodigo(), usuario.getIdActividad())%></td>
                    </tr>
                    <%
                        }
                        
                        %>
                  </tbody>
                </table>
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
  <script src="<%=request.getContextPath()%>/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="<%=request.getContextPath()%>/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level plugins -->
  <script src="<%=request.getContextPath()%>/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="<%=request.getContextPath()%>/js/demo/datatables-demo.js"></script>
  <script src="<%=request.getContextPath()%>/js/demo/chart-area-demo.js"></script>
  <script src="<%=request.getContextPath()%>/DG/js/pieChartA.js"></script>
  <script src="<%=request.getContextPath()%>/DG/js/chart-bar.js"></script>

</body>

</html>


