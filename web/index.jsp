<%-- 
    Document   : index
    Created on : Nov 15, 2019, 1:11:51 PM
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

  <title>Semana de ingenería</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-myColor">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-my-register-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h-25 text-gray-900 mb-5">Bienvenido</h1>
                  </div>
                  <form class="user" method="POST" action="MainServlet?action=iniciarSesion">
                    <div class="form-group">
                      <label for="username"></label><input id="username" name="usernameIniciarSesion" type="text" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Ingrese correo PUCP..." required>
                    </div>
                    <div class="form-group">
                      <label for="password"></label><input id="password" name="passwordIniciarSesion" type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Contraseña" required>
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                          <input type="checkbox" class="custom-control-input" id="customCheck">
                          <label class="custom-control-label" for="customCheck">Recordarme</label>

                      </div>
                    </div>
                      <!-- Este boton debe ser submit: -->
                      <input type="submit" value="Iniciar sesión" id="submit" class="btn btn-myColor btn-user btn-block"/>


                    <hr>
                    <!--
                    <a href="indexA.html" class="btn btn-google btn-user btn-block">
                      <i class="fab fa-google fa-fw"></i> Login with Google
                    </a>
                    <a href="indexA.html" class="btn btn-facebook btn-user btn-block">
                      <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook<hr>
                    </a>-->
                  </form>


                  <div class="text-center">
                    <a class="small" href="forgot-password.html">Olvidé mi contraseña</a>
                  </div>


                    <div class="text-center">
                    <a class="small" href="register.html">Crear cuenta!</a>
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
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

  <script>
    //var attempt = 3; // Variable to count number of attempts.
    // Below function Executes on click of login button.
    function validate(){
      var username = document.getElementById("username").value;
      var password = document.getElementById("password").value;
      if ( (username === "dg" && password === "dg") || ( username === "adming" && password === "adming")){

        window.location = "DG/indexDG.html"; // Redirecting to other page.
        alert ("Bienvenido delegado general");
        return false;
      }
      else if(username === "da" && password === "da"){
        window.location = "DA/indexDA.html"; // Redirecting to other page.
        alert ("Bienvenido delegado de actividad");
        
        return false;
      }
      else if(username === "al" && password === "al"){
        window.location = "Alumno/indexA.html"; // Redirecting to other page.
        alert ("Bienvenido alumno");
        return false;
      }

      /*
      else{
        attempt --;// Decrementing by one.
        alert("You have left "+attempt+" attempt;");
// Disabling fields after 3 attempts.
        if( attempt == 0){
          document.getElementById("username").disabled = true;
          document.getElementById("password").disabled = true;
          document.getElementById("submit").disabled = true;
          return false;

      }*/
    }

  </script>

</body>

</html>