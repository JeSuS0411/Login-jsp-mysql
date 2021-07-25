<%-- 
    Document   : Registrar
    Created on : 22/06/2021, 6:13:47 p. m.
    Author     : Yisus
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="Controlador.Controlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin 2 - Register</title>

        <!-- Custom fonts for this template-->
        <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="../css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body class="bg-gradient-primary">

        <div class="container">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                        <div class="col-lg-7">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                                </div>
                                <form class="user" method="POST">
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input name="name" type="text" class="form-control form-control-user" id="exampleFirstName"
                                                   placeholder="First Name">
                                        </div>
                                        <div class="col-sm-6">
                                            <input name="lastname" type="text" class="form-control form-control-user" id="exampleLastName"
                                                   placeholder="Last Name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input name="email" "type="email" class="form-control form-control-user" id="exampleInputEmail"
                                               placeholder="Email Address">
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input name="pass1" type="password" class="form-control form-control-user"
                                                   id="exampleInputPassword" placeholder="Password">
                                        </div>
                                        <div class="col-sm-6">
                                            <input name="pass2" type="password" class="form-control form-control-user"
                                                   id="exampleRepeatPassword" placeholder="Repeat Password">
                                        </div>
                                    </div>

                                    <button name="registrar" type="submit" class="btn btn-primary btn-user btn-block">Registrar cuenta</button>

                                </form>

                                <%

                                    if (request.getParameter("registrar") != null) {
                                        String email;
                                        String pass;
                                        String nombre;
                                        String apellido;

                                        nombre = request.getParameter("name");
                                        apellido = request.getParameter("lastname");
                                        email = request.getParameter("email");
                                        pass = request.getParameter("pass1");

                                        Controlador controlador = new Controlador();
                                        controlador.conectar();

                                        if (!controlador.hayConexion()) {
                                        response.sendRedirect("404.jsp");

                                        } else {

                                            Usuario usuario = new Usuario();
                                            usuario.setNombre(nombre);
                                            usuario.setApellido(apellido);
                                            usuario.setContraseña(pass);
                                            usuario.setEmail(email);

                                            controlador.addUSer(usuario);
                                            response.sendRedirect("Usuarios.jsp");
                                        }

                                    }

                                %>

                                <hr>

                                <div class="text-center">
                                    <a class="small" href="Login.jsp">Entrar con una cuenta ya existente</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="../js/sb-admin-2.min.js"></script>

    </body>

</html>
