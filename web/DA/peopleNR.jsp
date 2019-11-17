<%-- 
    Document   : peopleNR
    Created on : 16-nov-2019, 16:40:06
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

        <title>DA - Personas no registradas</title>

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

                    <div class="sidebar-brand-text mx-3" style="font-size: 13px; font-family: Arial">Delegado de actividad</div>
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

                <li class="nav-item">
                    <a class="nav-link" href="activities.jsp">
                        <i class="fas fa-fw fa-running"></i>
                        <span>Eventos</span></a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapsePers" aria-expanded="true" aria-controls="collapsePers">
                        <i class="fas fa-fw fa-user-friends"></i>
                        <span>Personas</span>
                    </a>
                    <div id="collapsePers" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item active" href="peopleNR.jsp">Personas no registradas</a>
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

                <li class="nav-item">
                    <a class="nav-link" href="donaciones.jsp">
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
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Gustavo Meza</span>
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

                    <!--CONTENIDO-->
                    <div class="container">

                        <h1 class="h3 mb-2 text-gray-800">Personas NO registradas</h1>
                        <p class="mb-4">Acá encontrarás a los alumnos y egresados de telecomunicaciones que todavía NO han sido registrados para participar en la actividad.</p>

                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Tabla de posibles participantes</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">

                                    <!--TABALA DE PERSONAS-->
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Nombre</th>
                                                <th>Correo PUCP</th>
                                                <th>Condición</th>
                                                <th></th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <tr>
                                                <td>Tiger Nixon</td>
                                                <td>ejemplopucp@pucp.edu.pe</td>
                                                <td>Egresado</td>
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="#editEmployeeModal" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Garrett Winters</td>
                                                <td>ejemplopucp@pucp.edu.pe</td>
                                                <td>Egresado</td>
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="#editEmployeeModal" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Ashton Cox</td>
                                                <td>ejemplopucp@pucp.edu.pe</td>
                                                <td>Egresado</td>
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="#editEmployeeModal" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Cedric Kelly</td>
                                                <td>ejemplopucp@pucp.edu.pe</td>
                                                <td>Egresado</td>
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="#editEmployeeModal" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Airi Satou</td>
                                                <td>ejemplopucp@pucp.edu.pe</td>
                                                <td>Egresado</td>
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="#editEmployeeModal" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Brielle Williamson</td>
                                                <td>ejemplopucp@pucp.edu.pe</td>
                                                <td>Egresado</td>
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="#editEmployeeModal" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Herrod Chandler</td>
                                                <td>ejemplopucp@pucp.edu.pe</td>
                                                <td>Egresado</td>
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="#editEmployeeModal" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Rhona Davidson</td>
                                                <td>ejemplopucp@pucp.edu.pe</td>
                                                <td>Egresado</td>
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="#editEmployeeModal" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Colleen Hurst</td>
                                                <td>ejemplopucp@pucp.edu.pe</td>
                                                <td>Egresado</td>
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="#editEmployeeModal" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Sonya Frost</td>
                                                <td>ejemplopucp@pucp.edu.pe</td>
                                                <td>Egresado</td>
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="#editEmployeeModal" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Jena Gaines</td>
                                                <td>ejemplopucp@pucp.edu.pe</td>
                                                <td>Alumno</td>
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="#editEmployeeModal" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Quinn Flynn</td>
                                                <td>ejemplopucp@pucp.edu.pe</td>
                                                <td>Alumno</td>
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="#editEmployeeModal" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Charde Marshall</td>
                                                <td>ejemplopucp@pucp.edu.pe</td>
                                                <td>Alumno</td>
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="#editEmployeeModal" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Haley Kennedy</td>
                                                <td>ejemplopucp@pucp.edu.pe</td>
                                                <td>Alumno</td>
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="#editEmployeeModal" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Tatyana Fitzpatrick</td>
                                                <td>ejemplopucp@pucp.edu.pe</td>
                                                <td>Alumno</td>
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="#editEmployeeModal" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Michael Silva</td>
                                                <td>ejemplopucp@pucp.edu.pe</td>
                                                <td>Alumno</td>
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="#editEmployeeModal" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Paul Byrd</td>
                                                <td>ejemplopucp@pucp.edu.pe</td>
                                                <td>Alumno</td>
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="#editEmployeeModal" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Gloria Little</td>
                                                <td>ejemplopucp@pucp.edu.pe</td>
                                                <td>Alumno</td>
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="#editEmployeeModal" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Bradley Greer</td>
                                                <td>ejemplopucp@pucp.edu.pe</td>
                                                <td>Alumno</td>
                                                <td>
                                                    <div class="form-group row text-center btn-user">
                                                        <div class="col-sm-4 mb-2 mb-sm-0">
                                                            <a href="#editEmployeeModal" style="color: green" class="button btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="#deleteEmployeeModal" style="color: green" class="button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
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

        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Miembro añadido</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Esta persona ha sido registrada al sistema. Para mayor información de las personas registradas entrar a <a target="_blank" href="peopleR.html">Personas registradas</a></p>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" value="OK">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Borrar solicitud de registro </h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>¿Estás seguro que no deseas aceptar a esta persona?</p>
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
