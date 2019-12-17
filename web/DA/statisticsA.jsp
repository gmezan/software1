<%-- 
    Document   : statisticsA
    Created on : 16-nov-2019, 16:50:54
    Author     : Labtel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Beans.Usuario"%>
<jsp:useBean id="usuario" type="Usuario" scope="session" />
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>DA - Estadísticas </title>

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
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
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
                <li class="nav-item active">
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
                        <i class="fas fa-fw fa-running"></i>
                        <span>Eventos</span></a>
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

                <li class="nav-item active">
                    <a class="nav-link " href="#" data-toggle="collapse" data-target="#collapseEstd" aria-expanded="true" aria-controls="collapseEstd">
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

                <li class="nav-item">
                    <a class="nav-link" href="donaciones.html">
                        <i class="fas fa-fw fa-dollar-sign"></i> <!--icono!!!!!-->
                        <span>Donaciones</span></a>
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

                    <!-- CONTENIDO -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Delegado de actividad - Estadísticas</h1>
                        <p class="mb-4">
                            Se muestra la lista de personas que están apoyando a eventos de una actividad así como un gráfico estadístico de la cantidad de alumnos por eventos.</p>

                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Alumnos y Egresados</h6>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-pie pt-4">
                                    <canvas id="myPieChart"></canvas>
                                </div>
                                <hr>
                                Se muestran todas las actividades registradas, para agregar o eliminar una actividad ingresar a <a target="_blank" href="activities.html">Actividades</a>.
                            </div>
                        </div>

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
                                                <th>Nombre del participante</th>
                                                <th>Estado</th>
                                                <th> Observaciones</th>
                                                <th> Foto de participante</th>
                                                <th> Eventos asistidos</th>
                                                <th> Modificar</th>
                                            </tr>
                                        </thead>
                                        <tfoot>

                                        </tfoot>
                                        <tbody>
                                            <tr>
                                                <td>Alumno 1</td>
                                                <td>Apto</td>
                                                <td>Puede asistir a todos los eventos.</td>
                                                <td><img src="https://images.clarin.com/2019/09/27/donald-trump-se-enfurecio-con___VlWW3Hbb_1256x620__1.jpg" height="100px" width="100px" class="img-fluid" alt="Responsive image">
                                                </td>
                                                <td>5</td>
                                                <td><a href="#editParticipacion" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-edit" style="color:white;" data-toggle="tooltip" title="Edit"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>Alumno 2</td>
                                                <td>Apto</td>
                                                <td>Sólo apoyará en la primera semana</td>
                                                <td><img src="https://cdn.cnn.com/cnnnext/dam/assets/190318100224-lionel-messi-exlarge-169.jpg" height="100px" width="100px" class="img-fluid" alt="Responsive image"></td>
                                                <td>10</td>
                                                <td><a href="#editParticipacion" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-edit" style="color:white;" data-toggle="tooltip" title="Edit"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>Alumno 3</td>
                                                <td>Expulsado</td>
                                                <td>Juega de arquero y defensa.</td>
                                                <td><img src="https://www.meokeke.com/wp-content/uploads/ascensio.jpg" height="100px" width="100px" class="img-fluid" alt="Responsive image"></td>
                                                <td>20</td>
                                                <td><a href="#editParticipacion" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-edit" style="color:white;" data-toggle="tooltip" title="Edit"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>Alumno 4</td>
                                                <td>Apto</td>
                                                <td>Tiene una amarilla acumulada.</td>
                                                <td><img src="https://www.ecestaticos.com/imagestatic/clipping/792/b27/792b27cce77633e608c56da5fa7976dc/los-250-diarios-de-cristiano-ronaldo-por-su-amor-a-espana-y-su-conciencia-tranquila.jpg?mtime=1550591252" height="100px" width="100px" class="img-fluid" alt="Responsive image"></td>
                                                <td>5</td>
                                                <td><a href="#editParticipacion" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-edit" style="color:white;" data-toggle="tooltip" title="Edit"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>Alumno 5</td>
                                                <td>Retirado</td>
                                                <td>No puede jugar partidos luego de las 9pm.</td>
                                                <td><img src="https://as.com/futbol/imagenes/2019/05/06/internacional/1557122398_488952_1557122527_noticia_normal.jpg" height="100px" width="100px" class="img-fluid" alt="Responsive image"></td>
                                                <td>8</td>
                                                <td><a href="#editParticipacion" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-edit" style="color:white;" data-toggle="tooltip" title="Edit"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>Alumno 6</td>
                                                <td>Baneado</td>
                                                <td>No puede llegar antes de las 8pm.</td>
                                                <td><img src="https://fcbarcelona-static-files.s3.amazonaws.com/fcbarcelona/photo/2019/02/08/2f146f67-7619-4df7-be41-a3fd26d7db50/OtroFCB-VIL02122018_pic_2018-12-03otrobarcelona-villarreal12-Optimized.jpg" height="100px" width="100px" class="img-fluid" alt="Responsive image"></td>
                                                <td>10</td>
                                                <td><a href="#editParticipacion" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-edit" style="color:white;" data-toggle="tooltip" title="Edit"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>Alumno 7</td>
                                                <td>Apto</td>
                                                <td>Solo juega como delantero.</td>
                                                <td><img src="https://as.com/futbol/imagenes/2019/01/24/primera/1548370158_049160_1548370305_noticia_normal.jpg" height="100px" width="100px" class="img-fluid" alt="Responsive image"></td>
                                                <td>3</td>
                                                <td><a href="#editParticipacion" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-edit" style="color:white;" data-toggle="tooltip" title="Edit"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>Alumno 8</td>
                                                <td>Apto</td>
                                                <td>No sabe las reglas de futsal.</td>
                                                <td><img src="https://amp.businessinsider.com/images/5ce7eb1a828ac164c16bea22-750-500.jpg" height="100px" width="100px" class="img-fluid" alt="Responsive image"></td>
                                                <td>10</td>
                                                <td><a href="#editParticipacion" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-edit" style="color:white;" data-toggle="tooltip" title="Edit"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>Alumno 9</td>
                                                <td>Apto</td>
                                                <td>Solo aguanta medio tiempo.</td>
                                                <td><img src="https://static01.nyt.com/images/2018/05/24/universal/guerreroes/guerreroes-master1050.jpg" height="100px" width="100px" class="img-fluid" alt="Responsive image"></td>
                                                <td>9</td>
                                                <td><a href="#editParticipacion" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-edit" style="color:white;" data-toggle="tooltip" title="Edit"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>Alumno 10</td>
                                                <td>Expulsado</td>
                                                <td>Es diestro.</td>
                                                <td><img src="https://www.pasionfutbol.com/__export/1555612752470/sites/pasionlibertadores/img/2019/04/18/higuain.jpg_715985292.jpg" height="100px" width="100px" class="img-fluid" alt="Responsive image"></td>
                                                <td>10</td>
                                                <td><a href="#editParticipacion" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-edit" style="color:white;" data-toggle="tooltip" title="Edit"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>Alumno 11</td>
                                                <td>Lesionado</td>
                                                <td>Es zurdo.</td>
                                                <td><img src="https://futbolete.com/wp-content/uploads/2019/03/noticias-futbol-falcao-seleccion-colombia-japon-2019.jpg" height="100px" width="100px" class="img-fluid" alt="Responsive image"></td>
                                                <td>12</td>
                                                <td><a href="#editParticipacion" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-edit" style="color:white;" data-toggle="tooltip" title="Edit"></i></a></td>
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
        <script src="<%=request.getContextPath()%>/DA/js/demo/datatables-demo.js"></script>
        <script src="<%=request.getContextPath()%>/DA/js/demo/chart-area-demo.js"></script>
        <script src="<%=request.getContextPath()%>/DA/js/pieChartA.js"></script>
        <script src="<%=request.getContextPath()%>/DA/js/demo/chart-bar-demo.js"></script>

        <!-- BOTÓN PARA MODIFICAR ESTADO-->
        <div id="editParticipacion" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Modificar</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Estado del jugador</label>
                                <select class="form-control form-control-user" type="text" >
                                    <option value="null">  -- Seleccione una opcion --</option>
                                    <option value="Equipo">Apto</option>
                                    <option value="Barras">Lesionado</option>
                                    <option value="Barras">Expulsado</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Observaciones</label>
                                <div class="body">
                                    <textarea name="comentarios" rows="5" cols="40">Escribe acá...</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Eventos asistidos<input type="number" class="form-control" required> </label>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                            <input type="submit" class="btn btn-info" value="Guardar">
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </body>

</html>

