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
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container mt-4 col-lg-4 ">
            <div class="card col-sm-10 bg-light">
                <div class="card-body ">
                    <form class="form-sign" action="Validar" method="POST">
                        <div>
                            <div class="form-group text-center my-2">
                                <h3>Login</h3>
                                <img src="img/logo.jpg" alt="70" width="350"/>
                                <label><h4>Bienvenidos al Sistema</h4></label>
                            </div>
                            <div class="form-group my-3">
                                <label>Usuario:</label>
                                <input type="text" name="txtuser" class="form-control">
                            </div>
                            <div class="form-group my-3">
                                <label>Password:</label>
                                <input type="password" name="txtpass" class="form-control">
                            </div>
                            <div class="form-group my-4">
                                <input type="submit" name="accion" value="Ingresar" class="btn btn-primary btn-block">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
