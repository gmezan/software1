<%-- 
    Document   : activities
    Created on : 16-nov-2019, 15:39:25
    Author     : Labtel
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

        <title>DA - Actividades</title>

        <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <link href="<%=request.getContextPath()%>/css/sb-admin-2.min.css" rel="stylesheet">

        <link href="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    </head>

    <body id="page-top">
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

                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="indexDA.html">
                    <div class="sidebar-brand-text mx-3" style="font-size: 13px; font-family: Arial">Delegado de Actividad</div>
                </a>

                <hr class="sidebar-divider my-0">

                <li class="nav-item">
                    <a class="nav-link" href="indexDA.html">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Menú Principal</span></a>
                </li>

                <hr class="sidebar-divider">

                <div class="sidebar-heading">
                    Funciones
                </div>

                <li class="nav-item active">
                    <a class="nav-link" href="activities.html">
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
                            <a class="collapse-item" href="peopleNR.html">Personas no registradas</a>
                            <a class="collapse-item" href="revisarParticipantes.html">Revisar participantes</a>
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
                            <a class="collapse-item" href="statisticsA.html">Cantidad de apoyos</a>
                        </div>
                    </div>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="donaciones.html">
                        <i class="fas fa-fw fa-dollar-sign"></i>
                        <span>Donaciones</span></a>
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
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Fernando Guzman</span>
                                    <img class="img-profile rounded-circle" src="https://placekitten.com/60/60">
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
                        <h1 class="h3 mb-2 text-gray-800">Eventos</h1>
                        <p class="mb-4">Acá encontrarás los eventos programados para semana, puedes añadir, editar o borrar eventos.</p>

                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Lista de eventos</h6>
                            </div>

                            <div class="container-fluid"style="padding-top: 10px">
                                <div class="col-sm-10 mb-3 mb-sm-0">
                                    <a href="anadirActividad.jsp" class="btn btn-success" ><span>Añadir Evento</span></a>
                                </div>                                
                            </div>

                            <div class="card-body">
                                <div class="table-responsive">

                                    <!--TABLA DE ACTIVIDADES-->
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Descripción</th>
                                                <th>Lugar</th>
                                                <th>Fecha</th>
                                                <th>Hora</th>
                                                
                                                <th></th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <tr>
                                                <td>Fibra vs Hormigon Armado</td>
                                                <td>Lugar A</td>
                                                <td>DD/MM/AA</td>
                                                <td>hora1</td>
                                                
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="editarActividad.html" style="color: green" class="button btn btn-success"><i class="fas fa-edit" style="color:white;" data-toggle="tooltip" title="Editar"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Eliminar"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Erectroshock vs Fibra</td>
                                                <td>Lugar B</td>
                                                <td>DD/MM/AA</td>
                                                <td>hora2</td>
                                                
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="editarActividad.html" style="color: green" class="button btn btn-success"><i class="fas fa-edit" style="color:white;" data-toggle="tooltip" title="Editar"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Eliminar"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Fibra vs Memoria Cache</td>
                                                <td>Lugar C</td>
                                                <td>DD/MM/AA</td>
                                                <td>hora3</td>
                                                
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="editarActividad.html" style="color: green" class="button btn btn-success"><i class="fas fa-edit" style="color:white;" data-toggle="tooltip" title="Editar"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Eliminar"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Fibra vs Erectroshock</td>
                                                <td>Lugar D</td>
                                                <td>DD/MM/AA</td>
                                                <td>hora4</td>
                                                
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="editarActividad.html" style="color: green" class="button btn btn-success"><i class="fas fa-edit" style="color:white;" data-toggle="tooltip" title="Editar"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Eliminar"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <!--FIN DE TABLA-->
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
                        <a class="btn btn-primary" href="../index.html">Cerrar sesión</a>
                    </div>
                </div>
            </div>
        </div>


        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Añadir actividad</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Nombre</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Descrición</label>
                                <input type="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Delegado</label>
                                <select class="form-control form-control-user" type="text" >
                                    <option value="null">  -- Seleccione una opcion --</option>
                                    <option value="Alumno">Delegado 1</option>
                                    <option value="Egresado">Delegado 2</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <!--Botón para editar-->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Editar actividad</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Nombre</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Descripción</label>
                                <input type="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Delegado</label>
                                <select class="form-control form-control-user" type="text" >
                                    <option value="null">  -- Seleccione una opcion --</option>
                                    <option value="Alumno">Delegado 1</option>
                                    <option value="Egresado">Delegado 2</option>
                                </select>
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
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Borrar actividad </h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
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
        
    </body>
</html>
