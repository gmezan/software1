<%-- 
    Document   : peopleDA
    Created on : 11/11/2019, 05:51:40 PM
    Author     : GUSTAVO
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Beans.Usuario"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<Usuario> lista1 = (ArrayList<Usuario>) request.getAttribute("listaDA");

    HashMap<Integer, String> listaAct = (HashMap<Integer, String>) request.getAttribute("listaActividad");
    HashMap<Integer, String> listaTodasActividades = (HashMap<Integer, String>) request.getAttribute("listaTodasActividades");

    %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>DG - Delegados de actividad</title>

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
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="indexDG.html">
            <div class="sidebar-brand-icon ">
                <i class="fas fa-broadcast-tower"></i>
            </div>
            <div class="sidebar-brand-text mx-3" style="font-size: 18px">Semana de ingeniería</div>
        </a>

        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="indexDG.html">

            <div class="sidebar-brand-text mx-3" style="font-size: 13px; font-family: Arial">Delegado General</div>
        </a>
        <!-- Divider -->

        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
            <a class="nav-link" href="indexDG.html">
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
            <a class="nav-link" href="<%=request.getContextPath()%>/ActividadServlet?action=listaActividades">
                <i class="fas fa-fw fa-running"></i> <!--icono!!!!!-->
                <span>Actividades</span></a>
        </li>

        <li class="nav-item active">
            <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapsePers" aria-expanded="true" aria-controls="collapsePers">
                <i class="fas fa-fw fa-user-friends"></i>
                <span>Personas</span>
            </a>
            <div id="collapsePers" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
<a class="collapse-item" href="<%=request.getContextPath()%>/UsuarioServlet?action=listaUsuario">Personas registradas</a>
            <a class="collapse-item " href="<%=request.getContextPath()%>/UsuarioServlet?action=listaNR">Personas no registradas</a>
            <a class="collapse-item" href="<%=request.getContextPath()%>/UsuarioServlet?action=listaBan">Personas baneadas</a>
                    <h6 class="collapse-header">Otro:</h6>
                    <a class="collapse-item active" href="<%=request.getContextPath()%>/UsuarioServlet?action=listaDA">Delegados de actividad</a>
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
                <h1 class="h3 mb-2 text-gray-800">Delegados de actividad</h1>
                <p class="mb-4">Acá encontrarás a los delegados de actividad</p>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">



                    <div class="card-header py-3 collapsed">
                        <h6 class="m-0 font-weight-bold text-primary">Tabla de datos</h6>
                    </div>

                    <div class="container-fluid"style="padding-top: 10px">



                    </div>



                    <div class="card-body">

                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Nombre</th>
                                    <th>Correo PUCP</th>
                                    <th>Actividad</th>
                                    <th>Acciones</th>

                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>Código</th>
                                    <th>Nombre</th>
                                    <th>Correo PUCP</th>
                                    <th>Actividad</th>
                                    <th>Acciones</th>
                                </tr>
                                </tfoot>
                                <tbody>

                                                                        <%
                          int i = 1;
                          for (Usuario u: lista1){
%>
                  <tr>
                      <td><%= u.getCodigoPucp()%></td>
                    <td><%= u.getNombre()+ " " + u.getApellido() %></td>
                    <td><%= u.getCorreoPucp()%></td>
                    <td><%= u.getActividad().getNombreActividad()%></td>
                    <td >
                      <div class="form-group row text-center btn-user">
                        <div class="col-sm-4 mb-2 mb-sm-0">
                          
                            <a href="#editP" data-id='<%= u.getCodigoPucp()%>' data-nombre='<%= u.getFullname() %>' data-correo=<%= u.getCorreoPucp()%> data-condicion=<%= u.getCondicion()%>  data-rol=<%= u.getRol().getId()%> data-idact=<%=u.getIdActividad()%> style="color: green" class="editar-Persona button btn btn-success" data-toggle="modal"><i class="fas fa-edit" style="color:white;" data-toggle="tooltip" title="Edit"></i></a>
               
                        </div>
                        <div class="col-sm-4">
                          <a href="#deleteP" data-id="<%=u.getCodigoPucp()%>" style="color: green" class="borrar-Persona button btn btn-danger" data-toggle="modal"><i class="fas fa-trash" style="color: white" data-toggle="tooltip" title="Edit"></i></a>
                       </div>
                      </div>
                    </td>

                  </tr>
                  <%
                      i++;
                      }
                    %>

                                </tbody>
                            </table>
                        </div>e
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
                    <h4 class="modal-title">Añadir miembro</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Nombre</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Correo PUCP</label>
                        <input type="email" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Condición</label>
                        <select class="form-control form-control-user" type="text" >
                            <option value="null">  -- Seleccione una opcion --</option>
                            <option value="Alumno">Alumno</option>
                            <option value="Egresado">Egresado</option>

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
<!-- Edit Modal HTML -->
  <div id="editP" class="modal fade">
    <div class="modal-dialog">
      <div class="modal-content">
        <form method="POST" action="UsuarioServlet?action=actualizar">
          <div class="modal-header">
            <h4 class="modal-title">Editar</h4>
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          </div>
          <div class="modal-body">

              
              <input type="hidden" id="codigoPucpUsuario"  name="codigoPucpUsuario" >
              
            <div class="form-group">
              <label>Nombre completo</label>
              <input type="text" id="nombreUsuario" name="nombreUsuario" class="form-control" disabled>
            </div>
            <div class="form-group">
              <label>Correo PUCP</label>
              <input type="email"  id="correoPucpUsuario" name="correoPucpUsuario" class="form-control" disabled>
            </div>
            <div class="form-group">
              <label>Condición</label>
                <input type="text" id="condicionUsuario" name ="condicionUsuario" class="form-control" disabled>
            </div>
 
            <div class="form-group" id="comboboxDA" style="display: none">
              <label>Actividad</label>
              <select   id="actividadEscogida" name="actividadEscogida" class="form-control form-control-user button" type="text" required>
                  <option class="button"  value="0"   >---Escoger Actividad---</option>
                  <%
                      for(Map.Entry mapElement: listaTodasActividades.entrySet() ){
                          
                          if(listaAct.containsKey(mapElement.getKey()))
                          { 
                              out.write("<option class='button'  value='"+mapElement.getKey()+"'   >" +mapElement.getValue()+ "</option>");
                          }
                          else
                          {
                              out.write("<option class='button' hidden='true' value='" + mapElement.getKey()+"'   >" +mapElement.getValue()+ "</option>");
                          }
                          // <option class="button"  value="<%=mapElement.getKey()>"   ><%=mapElement.getValue()></option>

                           } %>       
              </select>
            </div>
            <div class="form-check" >
                <input  type="checkbox" id="EditModalCheckboxDA" name="EditModalCheckboxDA" onclick="functionDA()" class="form-check-input"  >
              <label class="form-check-label" > Delegado de actividad</label>

            </div>

          </div>
          <div class="modal-footer">
            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
            <button type="submit" data-dismiss="modal" data-toggle="modal" data-target="#banP" class="btn btn-danger" value="Banear">Banear</button>
            <input type="submit" class="btn btn-info" value="Guardar">
          </div>
        </form>
      </div>
    </div>
  </div>

<!--delete Modal HTML -->
  <div id="deleteP" class="modal fade">
    <div class="modal-dialog">
      <div class="modal-content">
        <form method="POST" action="UsuarioServlet?action=borrar">
          <div class="modal-header">
            <h4 class="modal-title">Borrar miembro </h4>
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          </div>
          <div class="modal-body">
              <input type="hidden" id="codigoPucpUsuarioBorrar"  name="codigoPucpUsuarioBorrar" >
            <p>¿Estás seguro que deseas eliminar a esta persona?</p>
            <p class="text-warning"><small>Esta acción no se puede deshacer.</small></p>
          </div>
          <div class="modal-footer">
            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
            <input  type="submit" class="btn btn-danger" value="Borrar">
          </div>
        </form>
      </div>
    </div>
  </div>

<script src="<%=request.getContextPath()%>/https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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


<script>
        function functionDA() {
      // Get the checkbox
      var checkBox = document.getElementById("EditModalCheckboxDA");
      // Get the output text
      var cda = document.getElementById("comboboxDA");

      // If the checkbox is checked, display the output text
      if (checkBox.checked === true){
          checkBox.value = "true";
        cda.style.display = "block";
      } else {
          checkBox.value = "false";
        cda.style.display = "none";
      }
    }
      
     $(document).on("click", ".editar-Persona", function () {

     $(".modal-body  #codigoPucpUsuario").val(  $(this).data('id') );
     $(".modal-body .form-group #nombreUsuario").val(  $(this).data('nombre') );
     $(".modal-body .form-group #correoPucpUsuario").val(  $(this).data('correo') );
     $(".modal-body .form-group #condicionUsuario").val(  $(this).data('condicion') );
     $(".modal-body .form-check #EditModalCheckboxDA").prop("checked", false);
     if($(this).data('condicion') === "Egresado"){
         $(".modal-body .form-check #EditModalCheckboxDA").prop("disabled", true);
     }

    else{
        $(".modal-body .form-check #EditModalCheckboxDA").prop("disabled", false);
        $(".modal-body .form-group #actividadEscogida").val("0" );
        var rol = $(this).data('rol');
        var actividad = $(this).data('idact');

        if (rol.toString()==="2"){
            $(".modal-body .form-check #EditModalCheckboxDA").prop("checked", true);
            $(".modal-body .form-group #actividadEscogida").val(actividad );
        }
        
        functionDA(); 
        }
        });
      
      //codigoPucpUsuarioBorrar
      $(document).on("click", ".borrar-Persona", function () {
          $(".modal-body  #codigoPucpUsuarioBorrar").val(  $(this).data('id') );
      });
      </script>

</html>
