<%-- 
    Document   : anadirActividad
    Created on : 16-nov-2019, 15:55:00
    Author     : Labtel
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Beans.Usuario"%>
<%@page import="Beans.Evento"%>
<jsp:useBean id="usuario" type="Usuario" scope="session" />

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Semana de ingenería</title>

        <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <link href="<%=request.getContextPath()%>/css/sb-admin-2.min.css" rel="stylesheet">
    </head>

    <body id="page-top">
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        %>

        <!--INICIO DE PÁGINA-->
        <div id="wrapper">

            <!--BARRA IZQUIERDA-->
            <ul class="navbar-nav bg-gray-900 sidebar sidebar-dark accordion" id="accordionSidebar">

                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="indexDA.jsp">
                    <div class="sidebar-brand-icon ">
                        <i class="fas fa-broadcast-tower"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3" style="font-size: 18px">Semana de ingeniería</div>
                </a>

                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="indexDA.jsp">
                    <div class="sidebar-brand-text mx-3" style="font-size: 13px; font-family: Arial">Delegado de actividad </div>
                </a>

                <hr class="sidebar-divider my-0">

                <li class="nav-item active">
                    <a class="nav-link" href="indexDA.jsp">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Menú Principal</span></a>
                </li>

                <hr class="sidebar-divider">

                <div class="sidebar-heading">
                    Funciones
                </div>

                <li class="nav-item">
                    <a class="nav-link" href="activities.jsp">
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
                            <a class="collapse-item" href="peopleNR.jsp">Personas no registradas</a>
                            <a class="collapse-item" href="revisarParticipantes.jsp">Revisar participantes</a>
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
                            <a class="collapse-item" href="statisticsA.jsp">Cantidad de apoyos</a>
                        </div>
                    </div>
                </li>
                
                <li class="nav-item active">
                    <a class="nav-link" href="<%=request.getContextPath()%>/AlumnoServlet?action=donacionesDA">
                        <i class="fas fa-fw fa-dollar-sign"></i> <!--icono!!!!!-->
                        <span>Donaciones</span>
                    </a>
                </li>
                
                
                <!--
                
                

                <li class="nav-item">
                    <a class="nav-link" href="donaciones.jsp">
                        <i class="fas fa-fw fa-dollar-sign"></i>
                        <span>Donaciones</span></a>
                </li>
                
                -->

                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>
            </ul>
            <!--FIN DE BARRA IZQUIERDA-->

            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">

                    <!--BARRA SUPERIOR--> 
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"></form>

                        <ul class="navbar-nav ml-auto">

                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>

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

                            <div class="topbar-divider d-none d-sm-block"></div>

                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=usuario.getNombre()%> <%=usuario.getApellido()%></span>
                                    <img class="img-profile rounded-circle" src="https://placekitten.com/60/60">
                                </a>

                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Cerrar sesión
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <!--FIN DE BARRA SUPERIOR-->

                    <!-- CONTENIDO -->
                    <div class="container">

                        <h1 class="my-4">NUEVO EVENTO
                            <br></br>Ingrese los datos del nuevo evento
                        </h1>

                        <div class="container-full " >                            
                            <div class='container-full'>                                
                                <div class='panel-body'>

                                    <form class='form-horizontal' role='form' method="POST" action="<%=request.getContextPath()%>/EventoServlet?action=crear">

                                        <div class='form-group'>
                                            <label class='control-label col-md-2 col-md-offset-2'>Descripción del evento </label>
                                            <div class='col-md-8'>
                                                <div class='col-md-3 indent-small'>
                                                    <div class='form-group internal'>
                                                        <input class='form-control'  type='text' name='descripcion' required>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class='form-group'>
                                            <label class='control-label col-md-2 col-md-offset-2' for='id_accomodation'>Hora del evento</label>
                                            <div class='col-md-8'>
                                                <div class='col-md-3 indent-small'>
                                                    <div class='form-group internal'>
                                                        <input class='form-control'  type='time' name='hora' required>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class='form-group'>
                                            <label class='control-label col-md-2 col-md-offset-2' for='id_accomodation'>Lugar del Evento</label>
                                            <div class='col-md-8'>
                                                <div class='col-md-3 indent-small'>
                                                    <div class='form-group internal'>
                                                        <input class='form-control'  type='text' name='lugar' required>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class='form-group'>
                                            <label class='control-label col-md-2 col-md-offset-2' >Fecha del Evento </label>
                                            <div class='col-md-8'>
                                                <div class='col-md-3 indent-small'>
                                                    <div class='form-group internal'>
                                                        <input class='form-control'  type='date' name='fecha' required>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <input class='form-control'  type='hidden' name='idActividad'>

                                        <div class='form-group'>
                                            <div class='col-md-offset-4 col-md-3'>
                                                <button class='btn-lg btn-primary' type='submit'>Guardar</button>
                                            </div>
                                        </div>
                                    </form>   
                                            
                                        <div class='form-group'>
                                            <div class='col-md-offset-4 col-md-3'>
                                                <button class='btn-lg btn-danger'  type='button' onclick="location.href = '<%=request.getContextPath()%>/EventoServlet?action=listar'">Cancelar</button>
                                            </div>
                                        </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!--FIN DE CONTENIDO-->
                </div>

                <!--BARRA INFERIOR-->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span></span>
                        </div>
                    </div>
                </footer>

            </div>
        </div>
        <!--FIN DE PÁGINA-->

        <!--Botón para subir-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!--Botón para Logout-->
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

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
