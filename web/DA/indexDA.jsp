<%-- 
    Document   : indexDA
    Created on : 16-nov-2019, 13:25:39
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

        <title>DA - Menú Principal</title>

        <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <link href="<%=request.getContextPath()%>/css/sb-admin-2.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/DA/css/da_css.css" rel="stylesheet" type="text/css" >
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

                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="indexDA.jsp">
                    <div class="sidebar-brand-text mx-3" style="font-size: 13px; font-family: Arial">Delegado de actividad</div>
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
                            <a class="collapse-item" href="<%=request.getContextPath()%>/peopleNR.jsp">Personas no registradas</a>
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
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Royer yangali</span>
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
                        <h1 class="my-4">¡Bienvenido!
                            <small>Delegado de Futsal</small>
                        </h1>
                    </div>

                    <div class="container">
                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                                <img src="<%=request.getContextPath()%>/DA/imgDA/futsal.jpg" height="400" class="rounded" >
                            </div>
                            <div class="col-md-3"></div>
                        </div>
                    </div>

                    <div class="container">
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h2 class="h3 mb-0 text-gray-800">¡Conoce algunas de tus funciones!</h2>
                        </div>
                    </div>

                    <div class="container-fluid">
                        <div class="row">
                            <div class="container">
                                
                                <div class="card">
                                    <div class="face face1">
                                        <div class="content">
                                            <center><img src="https://image.flaticon.com/icons/png/512/45/45533.png"></center>
                                            <a href="#programarEntrenamiento" class="button btn-success" data-toggle="modal"><h3>Entrenamiento</h3></a>
                                        </div>
                                    </div>
                                    <div class="face face2">
                                        <div class="content">
                                            <h2></h2>
                                            <p>Programa entrenamientos con el equipo para que lleguen preparados al partido.</p>
                                            <p>Puedes enviarles un correo indicándoles el día y hora del entrenamiento.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="face face1">
                                        <div class="content">
                                            <img src="https://image.flaticon.com/icons/png/512/100/100898.png">
                                            <a href="#enviarAlerta" class="button btn-success" data-toggle="modal"><h3>Alertas</h3></a>
                                        </div>
                                    </div>
                                    <div class="face face2">
                                        <div class="content">
                                            <p>¡El partido se acerca, avísale al Equipo y a la Barra!</p>
                                            <p>Envía un correo a todos los participantes recordándoles la fecha y hora del partido más cercano.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="face face1">
                                        <div class="content">
                                            <center><img src="https://image.flaticon.com/icons/svg/1464/1464205.svg"></center>
                                            <a href="#comunicarseDG" class="button btn-success" data-toggle="modal"><h3>Comuníquese con el DG</h3></a>
                                        </div>
                                    </div>
                                    <div class="face face2">
                                        <div class="content">
                                            <p>Solicite al Delegado General cualquier cosa que necesita y en breve este le responderá al correo.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="face face1">
                                        <div class="content">
                                            <center> <img src="https://image.flaticon.com/icons/png/512/39/39915.png"></center>
                                            <a href="#solicitarApoyo" class="button btn-success" data-toggle="modal"><h3>Solicite Apoyo</h3></a>
                                        </div>
                                    </div>
                                    <div class="face face2">
                                        <div class="content">
                                            <p>Chequea las <a href="statisticsA.jsp">estadísticas</a> y si falta apoyo en barras o miembros en el equipo envíale un correo a toda la Fibra solicitando su ayuda.</p>
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
                        <a class="btn btn-primary" href="../index.html">Cerrar sesión</a>
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
        <script src="<%=request.getContextPath()%>/vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="<%=request.getContextPath()%>/js/demo/chart-area-demo.js"></script>
        <script src="<%=request.getContextPath()%>/js/demo/chart-pie-demo.js"></script>

        <!--Programar entrenamiento-->
        <div id="programarEntrenamiento" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Programar entrenamiento</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Seleccione el día:</label>
                                <input type="date" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Selecciones la hora:</label>
                                <input type="time" class="form-control" required>
                            </div>
                            <p>¿Seguro que quiere programar un entrenamiento en esta fecha?</p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                            <input type="submit" class="btn btn-info" value="Guardar">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--Enviar alertas-->
        <div id="enviarAlerta" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Enviar alerta</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Recordar a los participantes el partido...</label>
                                <select class="form-control form-control-user" type="text" >
                                    <option value="null">  -- Seleccione una opcion --</option>
                                    <option value="Partido1">VS Erectroshock</option>
                                    <option value="Partido2">VS Memoria Caché</option>
                                    <option value="Partido3">VS Huascaminas</option>
                                    <option value="Partido4">VS Hormigón Armado</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                            <input type="submit" class="btn btn-info" value="Enviar">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--Enviar correo solicitando apoyo-->
        <div id="solicitarApoyo" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Solicitar apoyo</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <textarea name="comentarios" rows="10" cols="40">Escribe acá el correo...</textarea>
                            <p>¿Estás seguro que desea enviar el correo a toda la fibra solicitando su apoyo?</p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                            <input type="submit" class="btn btn-danger" value="Enviar">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--Comunicar al DG-->
        <div id="comunicarseDG" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Comuníquese con el Delegado General</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <p>Consulte o solicite si le falta algo</p>
                                <input type="radio" name="opcion" value="1">Gatorade para los partidos
                                <br>
                                <input type="radio" name="opcion" value="2">Pelota para entrenar
                                <br>
                                <input type="radio" name="opcion" value="3">Cancha para entrenar
                                <br>
                                <input type="radio" name="opcion" value="3"><input type="text" name="nombredelacaja">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                            <input type="submit" class="btn btn-info" value="Enviar">
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
