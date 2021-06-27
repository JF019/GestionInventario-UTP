<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql"     uri="http://java.sun.com/jsp/jstl/sql"  %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- Optional JavaScript; choose one of the two! -->
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        -->
        <title>Sistema de Ventas</title>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid mx-3">
                <a class="navbar-brand" href="#"><h3>Sistema de Ventas</h3></a>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a style="margin-left:10px; border: none;" 
                               class="btn btn-outline-light active" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a style="margin-left:10px; border: none;" 
                               class="btn btn-outline-light active" href="Controlador?menu=Producto&accion=Listar" target="myFrame">Producto</a>
                        </li>
                        <li class="nav-item">
                            <a style="margin-left:10px; border: none;" 
                               class="btn btn-outline-light active" href="Controlador?menu=Empleado&accion=Listar" target="myFrame">Empleado</a>
                        </li>
                        <li class="nav-item">
                            <a style="margin-left:10px; border: none;" 
                               class="btn btn-outline-light active" href="Controlador?menu=Clientes&accion=Listar" target="myFrame">Clientes</a>
                        </li>
                        <li class="nav-item">
                            <a style="margin-left:10px; border: none;" 
                               class="btn btn-outline-light active" href="Controlador?menu=NuevaVenta&accion=default" target="myFrame">Nueva Venta</a>
                        </li>
                    </ul>

                </div>
                <div class="dropdown my-3 d-flex ">
                    <button class="btn  btn-outline-secondary  me-md-5 dropdown-toggle  " 
                            type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                        ${usuario.getNom()}
                    </button>
                    <div class="dropdown-menu text-center" aria-labelledby="dropdownMenuButton1">
                        <li><a class="dropdown-item" href="#">
                                <img src="img/user.png" alt="60" width="60"/>
                            </a></li>
                        <li><a class="dropdown-item" href="#">${usuario.getUser()}</a></li>
                        <li><a class="dropdown-item" href="#">${usuario.getUser()}@gmail.com</a></li>
                        <div class="dropdown-divider"></div>
                        <form action="Validar" method="POST">
                            <button name="accion"  value="Salir" class="dropdown-item" href="#">Salir</button>
                            </form>
                    </div>
                </div>
            </div>
        </nav>
                        <div class="m-4" style="height: 550px;">
                            <iframe name="myFrame" style="height: 100%; width: 100%; border: none;"></iframe>
                        </div>

    </body>
</html>
