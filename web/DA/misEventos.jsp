<%-- 
    Document   : misEventos
    Created on : 18/12/2019, 12:16:57 AM
    Author     : katty
--%>

<%@page import="Beans.Evento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Beans.Usuario"%>
<jsp:useBean id="usuario" type="Usuario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="listaEventosParticipando" type="ArrayList<Evento>" scope="request" />
<jsp:useBean id="listaEventosNoRegistrado" type="ArrayList<Evento>" scope="request" />

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Mis Eventos</title>

        <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <link href="<%=request.getContextPath()%>/css/sb-admin-2.min.css" rel="stylesheet">

        <link href="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    </head>

    <body id="page-top">
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        %>

        <!--INICIO DE PÁGINA-->
        <div id="wrapper">

            <!--BARRA IZQUIERDA-->
            <ul class="navbar-nav bg-gray-900 sidebar sidebar-dark accordion" id="accordionSidebar">
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath()%>/DA?action=main">
                    <div class="sidebar-brand-icon ">
                        <i class="fas fa-broadcast-tower"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3" style="font-size: 18px">Semana de ingeniería</div>
                </a>

                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath()%>/DA?action=main">
                    <div class="sidebar-brand-text mx-3" style="font-size: 13px; font-family: Arial">Delegado de <%= usuario.getActividad().getNombreActividad()%></div>
                </a>

                <hr class="sidebar-divider my-0">

                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/DA?action=main">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Menú Principal</span></a>
                </li>

                <hr class="sidebar-divider">

                <div class="sidebar-heading">
                    Funciones
                </div>
                
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/EventoServlet?action=listaEventosParaInscribirse">
                        <i class="fas fa-fw fa-running"></i> <!--icono!!!!!-->
                        <span>Eventos para inscribirse</span></a>
                </li>
                
                <li class="nav-item active">
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

                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/DA?action=donaciones">
                        <i class="fas fa-fw fa-dollar-sign"></i>
                        <span>Donaciones</span>
                    </a>
                </li>

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
                                                <button class="btn btn-primary" type="button">
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
                                    <img class="img-profile rounded-circle" src="<%=request.getContextPath()%>/DA/imgDA/perfil.jpg">
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

                    <!--CONTENIDO-->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Mis eventos</h1>
                        <p class="mb-4">Acá encontrarás los eventos en los que estás participando. Si aun no has sido aceptado en un evento, puedes observarlo en la segunda lista.</p>
                        <br>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Eventos en los que participas</h6>
                            </div>

                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Actividad</th>
                                                <th>Nombre del evento</th>
                                                <th>Rol</th>
                                                <th>Lugar</th>
                                                <th>Fecha</th>
                                                <th>Hora</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <% int i = 1;
                                                for (Evento e : listaEventosParticipando) {
                                            %>
                                            <tr>
                                                <td><%=e.getAct().getNombreActividad()%></td>
                                                <td><%=e.getDescripcion()%></td>
                                                <td><%=e.getEst().getEstado()%></td>
                                                <td><%=e.getLugar()%></td>
                                                <td><%=e.getFecha()%></td>
                                                <td><%=e.getHora()%></td>
                                            </tr>
                                            <%        i++;
                                                }
                                            %>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>

                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Eventos en los que te inscribiste (solicitud en proceso)</h6>
                            </div>

                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Actividad</th>
                                                <th>Nombre del evento</th>                                                
                                                <th>Lugar</th>
                                                <th>Fecha</th>
                                                <th>Hora</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                            <% int j = 1;
                                                for (Evento ev : listaEventosNoRegistrado) {
                                            %>
                                            <tr>
                                                <td><%=ev.getAct().getNombreActividad()%></td>
                                                <td><%=ev.getDescripcion()%></td>                                                
                                                <td><%=ev.getLugar()%></td>
                                                <td><%=ev.getFecha()%></td>
                                                <td><%=ev.getHora()%></td>
                                            </tr>
                                            <%
                                                    j++;
                                                }

                                            %>
                                        </tbody>
                                    </table>

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

        <div id="addEvento" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form  method="POST" action="<%=request.getContextPath()%>/EventoServlet?action=crear">

                        <div class="modal-header">
                            <h4 class="modal-title">Añadir actividad</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>                        
                        <div class="modal-body">

                            <input class='form-control'  type='hidden' name='idActividad'>

                            <div class="form-group">
                                <label>Descripción del evento</label>
                                <input class='form-control'  type='text' name='descripcion' required>
                            </div>
                            <div class="form-group">
                                <label>Hora del evento</label>
                                <input class='form-control'  type='time' name='hora' required>
                            </div>
                            <div class="form-group">
                                <label>Lugar del Evento</label>
                                <input class='form-control'  type='text' name='lugar' required>
                            </div>
                            <div class="form-group">
                                <label>Fecha del Evento</label>
                                <input class='form-control'  type='date' name='fecha' required>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Guardar">
                        </div>
                    </form>
                </div>
            </div>
        </div>

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

        <!--Botón para editar-->
        <div id="editEvento" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="POST" action="<%=request.getContextPath()%>/EventoServlet?action=editar">
                        <div class="modal-header">
                            <h4 class="modal-title">Editar actividad</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">

                            <input type="hidden" id="eventoId" name="eventoId">

                            <div class="form-group">
                                <label>Descripción</label>
                                <input type="text" id="descripcion" name="descripcion" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Lugar</label>
                                <input type="text" id="lugar" name="lugar" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Hora</label>
                                <input type="time" id="hora" name="hora" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Fecha</label>
                                <input type="date" id="fecha" name="fecha" class="form-control" required>
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

        <!--Botón para borrar-->
        <div id="deleteEvento" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="POST" action="<%=request.getContextPath()%>/EventoServlet?action=borrar">
                        <div class="modal-header">
                            <h4 class="modal-title">Borrar actividad </h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" id="eventoId" name="eventoId">
                            <p>¿Estás seguro que deseas eliminar esta actividad?</p>
                            <p class="text-warning"><small>Esta acción no se puede deshacer.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                            <input type="submit" class="btn btn-danger" value="Borrar">
                        </div>
                    </form>
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

        <!-- Page level custom scripts -->
        <script src="<%=request.getContextPath()%>/js/demo/datatables-demo.js"></script>

        <script>

            $(document).on("click", ".editar-Actividad", function () {

                $(".modal-body  #eventoId").val($(this).data('id'));
                $(".modal-body .form-group #descripcion").val($(this).data('descripcion'));
                $(".modal-body .form-group #lugar").val($(this).data('lugar'));
                $(".modal-body .form-group #hora").val($(this).data('hora'));
                $(".modal-body .form-group #fecha").val($(this).data('fecha'));

            });


            $(document).on("click", ".borrar-Actividad", function () {

                $(".modal-body  #eventoId").val($(this).data('id'));
                $(".modal-body .form-group #nombreActividadBorrar").val($(this).data('nombre'));


            });
        </script>

    </body>
</html>