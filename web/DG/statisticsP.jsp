<%-- 
    Document   : statisticsP
    Created on : 12/11/2019, 01:09:04 AM
    Author     : GUSTAVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>DG - Estadísticas de alumnos y egresados</title>

  <!-- Custom fonts for this template -->
  <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath()%>/https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath()%>/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

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
      <li class="nav-item">
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

      <li class="nav-item active">
        <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseEstd" aria-expanded="true" aria-controls="collapseEstd">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Estadísticas</span>
        </a>
        <div id="collapseEstd" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Todas las estadísticas</h6>
            <a class="collapse-item" href="<%=request.getContextPath()%>/EstadisticasDgServlet?action=estadisticaApoyos">Cantidad de apoyos</a>
            <a class="collapse-item" href="<%=request.getContextPath()%>/EstadisticasDgServlet?action=estadisticaRecaudaciones">Recaudaciones</a>
            <a class="collapse-item active" href="<%=request.getContextPath()%>/EstadisticasDgServlet?action=estadisticaPersonas">Alumnos y egresados</a>
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
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Gustavo Meza</span>
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
          <h1 class="h3 mb-2 text-gray-800">Alumnos y egresados</h1>
          <p class="mb-4">Acá se muestra la cantidad de alumnos y egresados participando.</p>

          <div class="card shadow mb-4">
            <!-- Card Header - Dropdown -->
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Pie Chart</h6>
            </div>
            <!-- Card Body -->
            <div class="card-body">
              <div class="chart-pie pt-4">
                <canvas id="myPieChart"></canvas>
              </div>
              <hr>
              Para ver mayor información de alumnos y egresados ingresar a <a target="_blank" href="peopleR.html">Personas registradas</a>
            </div>
          </div>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Tabla de datos</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                  <tr>
                    <th>Nombre</th>
                    <th>¿Cumplió la cuota mínima?</th>
                    <th>Condición</th>
                    <th>Donación (S/.)</th>

                  </tr>
                  </thead>
                  <tfoot>
                  <tr>
                    <th>Nombre</th>
                    <th>¿Cumplió la cuota mínima?</th>
                    <th>Condición</th>
                    <th>Donación (S/.)</th>
                  </tr>
                  </tfoot>
                  <tbody>
                  <tr>
                    <td>Tiger Nixon</td>
                    <td>System Architect</td>
                    <td>Egresado</td>
                    <td>61</td>

                  </tr>
                  <tr>
                    <td>Garrett Winters</td>
                    <td>Accountant</td>
                    <td>Egresado</td>
                    <td>63</td>

                  </tr>
                  <tr>
                    <td>Ashton Cox</td>
                    <td>Junior Technical Author</td>
                    <td>Egresado</td>
                    <td>66</td>

                  </tr>
                  <tr>
                    <td>Cedric Kelly</td>
                    <td>Senior Javascript Developer</td>
                    <td>Egresado</td>
                    <td>22</td>

                  </tr>
                  <tr>
                    <td>Airi Satou</td>
                    <td>Accountant</td>
                    <td>Egresado</td>
                    <td>33</td>

                  </tr>
                  <tr>
                    <td>Brielle Williamson</td>
                    <td>Integration Specialist</td>
                    <td>Egresado</td>
                    <td>61</td>

                  </tr>
                  <tr>
                    <td>Herrod Chandler</td>
                    <td>Sales Assistant</td>
                    <td>Egresado</td>
                    <td>59</td>

                  </tr>
                  <tr>
                    <td>Rhona Davidson</td>
                    <td>Integration Specialist</td>
                    <td>Egresado</td>
                    <td>55</td>

                  </tr>
                  <tr>
                    <td>Colleen Hurst</td>
                    <td>Javascript Developer</td>
                    <td>Egresado</td>
                    <td>39</td>

                  </tr>
                  <tr>
                    <td>Sonya Frost</td>
                    <td>Software Engineer</td>
                    <td>Egresado</td>
                    <td>23</td>

                  </tr>
                  <tr>
                    <td>Jena Gaines</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>30</td>

                  </tr>
                  <tr>
                    <td>Quinn Flynn</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>22</td>

                  </tr>
                  <tr>
                    <td>Charde Marshall</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>36</td>

                  </tr>
                  <tr>
                    <td>Haley Kennedy</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>43</td>

                  </tr>
                  <tr>
                    <td>Tatyana Fitzpatrick</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>19</td>

                  </tr>
                  <tr>
                    <td>Michael Silva</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>66</td>

                  </tr>
                  <tr>
                    <td>Paul Byrd</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>64</td>

                  </tr>
                  <tr>
                    <td>Gloria Little</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>59</td>

                  </tr>
                  <tr>
                    <td>Bradley Greer</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>41</td>

                  </tr>
                  <tr>
                    <td>Dai Rios</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>35</td>

                  </tr>
                  <tr>
                    <td>Jenette Caldwell</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>30</td>

                  </tr>
                  <tr>
                    <td>Yuri Berry</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>40</td>

                  </tr>
                  <tr>
                    <td>Caesar Vance</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>21</td>

                  </tr>
                  <tr>
                    <td>Doris Wilder</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>23</td>

                  </tr>
                  <tr>
                    <td>Angelica Ramos</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>47</td>

                  </tr>
                  <tr>
                    <td>Gavin Joyce</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>42</td>

                  </tr>
                  <tr>
                    <td>Jennifer Chang</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>28</td>

                  </tr>
                  <tr>
                    <td>Brenden Wagner</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>28</td>

                  </tr>
                  <tr>
                    <td>Fiona Green</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>48</td>

                  </tr>
                  <tr>
                    <td>Shou Itou</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>20</td>

                  </tr>
                  <tr>
                    <td>Michelle House</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>37</td>

                  </tr>
                  <tr>
                    <td>Suki Burks</td>
                    <td>Developer</td>
                    <td>Egresado</td>
                    <td>53</td>

                  </tr>
                  <tr>
                    <td>Prescott Bartlett</td>
                    <td>Technical Author</td>
                    <td>Egresado</td>
                    <td>27</td>

                  </tr>
                  <tr>
                    <td>Gavin Cortez</td>
                    <td>Team Leader</td>
                    <td>Egresado</td>
                    <td>22</td>


                  </tr>
                  <tr>
                    <td>Martena Mccray</td>
                    <td>Post-Sales support</td>
                    <td>Egresado</td>
                    <td>46</td>


                  </tr>
                  <tr>
                    <td>Unity Butler</td>
                    <td>Marketing Designer</td>
                    <td>Egresado</td>
                    <td>47</td>


                  </tr>
                  <tr>
                    <td>Howard Hatfield</td>
                    <td>Office Manager</td>
                    <td>Egresado</td>
                    <td>51</td>


                  </tr>
                  <tr>
                    <td>Hope Fuentes</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>41</td>


                  </tr>
                  <tr>
                    <td>Vivian Harrell</td>
                    <td>-</td>
                    <td>Alumno</td>
                    <td>62</td>


                  </tr>
                  <tr>
                    <td>Timothy Mooney</td>
                    <td>Office Manager</td>
                    <td>Egresado</td>
                    <td>37</td>


                  </tr>
                  <tr>
                    <td>Jackson Bradshaw</td>
                    <td>Director</td>
                    <td>Egresado</td>
                    <td>65</td>


                  </tr>
                  <tr>
                    <td>Olivia Liang</td>
                    <td>Support Engineer</td>
                    <td>Egresado</td>
                    <td>64</td>


                  </tr>
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
  <script src="<%=request.getContextPath()%>/DG/js/pieChartP.js"></script>
  <script src="<%=request.getContextPath()%>/js/demo/chart-bar-demo.js"></script>

</body>

</html>