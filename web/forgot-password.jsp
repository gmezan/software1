<%-- 
    Document   : forgot-password
    Created on : Nov 15, 2019, 1:31:43 PM
    Author     : Gustavo_Meza
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

  <title>Reinicio de Contraseña</title>

  <!-- Custom fonts for this template-->
  <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath()%>/https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<%=request.getContextPath()%>/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-myColor">
<!--bg-gradient-primary-->
  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-image-semana"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-2">¿Olvidaste tu contraseña?</h1>
                    <p class="mb-4">Ingresa tu correo abajo y te enviaremos un enlace para que puedas reiniciar tu contraseña</p>
                  </div>
                    <form class="user" method="POST" action="<%=request.getContextPath()%>/MainServlet?action=correoRecuperar">
                    <div class="form-group">
                      <input type="email" class="form-control form-control-user" name="correoRecuperar" aria-describedby="emailHelp" placeholder="Ingresa tu correo PUCP">
                    </div>
                    <input type="submit" class="btn btn-myColor btn-user btn-block" value="Reiniciar contraseña"/>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="<%=request.getContextPath()%>/MainServlet?action=registrarse" >Crear una cuenta!</a> <!--style="color: #121212"-->
                  </div>
                  <div class="text-center">
                    <a class="small" href="<%=request.getContextPath()%>/MainServlet" >Ya tengo una cuenta, Inicar sesión!</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
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

</body>

</html>
