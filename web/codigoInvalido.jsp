<%-- 
    Document   : register
    Created on : Nov 15, 2019, 1:32:24 PM
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

        <title>Ups!</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <style>
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
        </style>
    </head>

    <body class="bg-myColor">

        <div class="container">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-5 d-none d-lg-block bg-my-register-image"></div>
                        <div class="col-lg-7">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h-25 text-gray-900 mb-5">Ups!</h1>
                                    <p class="mb-4">Parece que tu codigo ya existe en nuestro sistema. Intenta crear tu cuenta otra vez o recuperar tu contraseña.</p>
                                </div>

                                <div class="text-center">
                                    <a class="small" href="<%=request.getContextPath()%>/MainServlet?action=registrarse">Crea tu cuenta!</a>
                                </div>

                                <div class="text-center">
                                    <a class="small" href="<%=request.getContextPath()%>/MainServlet?action=recuperar">Olvidé mi contraseña</a>
                                </div>
                                <div class="text-center">
                                    <a class="small" href="<%=request.getContextPath()%>/MainServlet">¿Ya tienes una cuenta? Inicia sesión!</a>
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

    </body>

</html>
