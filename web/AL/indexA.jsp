<%-- 
    Document   : indexA
    Created on : 16-nov-2019, 16:22:01
    Author     : Labtel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Beans.Usuario"%>
<jsp:useBean id="usuario" type="Usuario" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Alumno</title>

        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/AL/css/css.css">


        <!-- Custom fonts for this template-->


        <!-- Custom styles for this template-->
        <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="<%=request.getContextPath()%>/css/sb-admin-2.min.css" rel="stylesheet">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>





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
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="indexA.html">
                    <div class="sidebar-brand-icon ">
                        <i class="fas fa-broadcast-tower"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3" style="font-size: 18px">Semana de ingenierÌa</div>
                </a>

                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="indexA.html">

                    <div class="sidebar-brand-text mx-3" style="font-size: 13px; font-family: Arial">Alumno</div>
                </a>
                <!-- Divider -->

                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="<%=request.getContextPath()%>/AlumnoServlet">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Inicio</span></a>
                </li>


                <!-- Modificacion -->
                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    funciones
                </div>

                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/AlumnoServlet?action=listaEventos">
                        <i class="fas fa-fw fa-running"></i> <!--icono!!!!!-->
                        <span>Mis eventos</span></a>
                </li>


                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/AlumnoServlet?action=donaciones">
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

                        

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="http://localhost:63342/sw1/Alumno/indexA.html#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                                <a class="nav-link dropdown-toggle" href="<%=request.getContextPath()%>/AL/indexA.jsp#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=usuario.getNombre()%> <%=usuario.getApellido()%></span>
                                    <img class="img-profile rounded-circle" src="<%=request.getContextPath()%>/AL/indexA_files/60">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">

                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Cerrar sesiÛn
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
                            <h1 class="h3 mb-0 text-gray-800">°Conoce las actividades de semana de ingenieria!</h1>
                            <!--
                            <a href="#" class="d-none d-sm-inline-block btn btn-sm bg-gray-900 shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                            -->
                        </div>

                        <!-- Content Row -->



                        <!-- slides-->


                        <div class="container-fluid" style="width:80%;">
                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ol class="carousel-indicators">
                                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                    <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                                    <li data-target="#myCarousel" data-slide-to="2" class=""></li>
                                    <li data-target="#myCarousel" data-slide-to="3" class=""></li>
                                    <li data-target="#myCarousel" data-slide-to="4" class=""></li>
                                    <li data-target="#myCarousel" data-slide-to="5" class=""></li>
                                    <li data-target="#myCarousel" data-slide-to="6" class=""></li>


                                </ol>

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">



                                    <div class="carousel-item active">
                                        <img src="<%=request.getContextPath()%>/images/baileton.jpeg" alt="Baileton" style="width:100%; ">
                                        <div class="carousel-caption">
                                            <h3>Baileton</h3>
                                            <p>Descripcion baileton</p>
                                        </div>
                                    </div>

                                    <div class="carousel-item">
                                        <img src="<%=request.getContextPath()%>/images/bas.jpeg" alt="Basquet" style="width:100%;">
                                        <div class="carousel-caption">
                                            <h3>Basquet</h3>
                                            <p>Descripcion basket</p>
                                        </div>
                                    </div>

                                    <div class="carousel-item">
                                        <img src="<%=request.getContextPath()%>/images/danza.jpeg" alt="Danza" style="width:100%;">
                                        <div class="carousel-caption">
                                            <h3>Danza</h3>
                                            <p>Descripcion danza</p>
                                        </div>
                                    </div>

                                    <div class="carousel-item">
                                        <img src="<%=request.getContextPath()%>/images/futbol.jpeg" alt="Futsal" style="width:100%;">
                                        <div class="carousel-caption">
                                            <h3>Futsal</h3>
                                            <p>Descripcion futsal</p>
                                        </div>
                                    </div>

                                    <div class="carousel-item">
                                        <img src="<%=request.getContextPath()%>/images/natacion.jpeg" alt="Natacion" style="width:100%;">
                                        <div class="carousel-caption">
                                            <h3>Natacion</h3>
                                            <p>Descripcion natacion</p>
                                        </div>
                                    </div>

                                    <div class="carousel-item">
                                        <img src="<%=request.getContextPath()%>/images/sketch.jpeg" alt="Sketch" style="width:100%;">
                                        <div class="carousel-caption">
                                            <h3>Sketch</h3>
                                            <p>Descripcion sketch</p>
                                        </div>
                                    </div>

                                    <div class="carousel-item">
                                        <img src="<%=request.getContextPath()%>/images/volei.jpeg" alt="Voley" style="width:100%;">
                                        <div class="carousel-caption">
                                            <h3>Voley</h3>
                                            <p>Descripcion voley</p>
                                        </div>
                                    </div>






                                </div>

                                <!-- Left and right controls -->
                                <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a  class="carousel-control-next" href="#myCarousel" data-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>


                        <br>
                        <br>


                        <div class="container-fluid">

                            <!-- Page Heading -->
                            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                <h1 class="h3 mb-0 text-gray-800">°Conoce a tus delegados generales!</h1>
                            </div>
                        </div>


                        <div class="row">
                            <div class="container">


                                <div class="card" style="width: 20%;">

                                    <div class="face face1" style="width: 100%;">

                                        <img src="<%=request.getContextPath()%>/images/pine.jpeg" style="width: 100%;">


                                    </div>
                                    <div class="face face2" style="width: 100%;">
                                        <div class="content">
                                            <h2>Chris Pine</h2>
                                            <p>Celular: 966980925</p>
                                            <p>Correo: chrispine@pucp.edu.pe</p>

                                        </div>
                                    </div>
                                </div>


                                <div class="card" style="width: 20%;">

                                    <div class="face face1" style="width: 100%;">

                                        <img src="<%=request.getContextPath()%>/images/muro.jpeg" style="width: 100%;">


                                    </div>
                                    <div class="face face2" style="width: 100%;">
                                        <div class="content">
                                            <h2>Sergio Muro</h2>
                                            <p>Celular: 941963750</p>
                                            <p>Correo: sergiomuro@pucp.edu.pe</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="card" style="width: 20%;">
                                    <div class="face face1" style="width: 100%;">

                                        <img src="<%=request.getContextPath()%>/images/goslin.jpeg" style="width: 100%;">


                                    </div>
                                    <div class="face face2" style="width: 100%;">
                                        <div class="content">
                                            <h2>Ryan Gosling</h2>
                                            <p>Celular: 900854763</p>
                                            <p>Correo: ryangosling@pucp.edu.pe</p>

                                        </div>
                                    </div>
                                </div>

                                <div class="card" style="width: 20%;">
                                    <div class="face face1" style="width: 100%;">

                                        <img src="<%=request.getContextPath()%>/images/burga.jpeg" style="width: 100%;">


                                    </div>
                                    <div class="face face2" style="width: 100%;">
                                        <div class="content">
                                            <h2>Alvaro Burga</h2>
                                            <p></p>
                                            <p>Celular: 947865125</p>
                                            <p>Correo: alvaroburga@pucp.edu.pe</p>


                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
        </div>
        <!-- End of Content Wrapper -->


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
                            <span aria-hidden="true">◊</span>
                        </button>
                    </div>
                    <div class="modal-body">Selecciona "Cerrar sesiÛn" abajo si est·s listo para cerrar tu sesiÛn actual.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                        <a  class="btn btn-primary" href="<%=request.getContextPath()%>/MainServlet?action=inicio">Cerrar sesiÛn</a>
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
