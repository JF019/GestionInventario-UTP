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
        <div class="container d-flex">
            <div class=" col-sm-4" style="width: 30rem;">
                <div class="card my-1">
                    <div class="card-body">
                        <div class="titulo my-2"><h3>PRODUCTO</h3></div>
                        <form action="Controlador?menu=Producto" method="POST">
                            <div class="form-group">
                                <label>Nombres</label>
                                <input type="text" value="${producto.getNom()}" name="txtNom" class="form-control my-1">
                            </div>
                            <div class="form-group">
                                <label>Precio</label>
                                <input type="text" value="${producto.getPre()}" name="txtPre" class="form-control my-1">
                            </div>
                            <div class="form-group">
                                <label>Stock</label>
                                <input type="text" value="${producto.getSto()}" name="txtSto" class="form-control my-1">
                            </div>
                            <div class="form-group">
                                <label>Estado</label>
                                <input type="text" value="${producto.getEst()}" name="txtEst" class="form-control my-1">
                            </div>
                            
                            <input type="submit" name="accion" value="Agregar" class="btn btn-outline-primary active my-2">
                            <input type="submit" name="accion" value="Actualizar" class="btn btn-outline-success active my-2">
                        </form>
                    </div>
                </div>
            </div>
            <div class="container col-sm-8">
                <div class="card my-1">
                    <div class="card-body">
                        <div class="titulo my-2"><h3>Lista de Productos</h3></div>
                        <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>NOMBRES</th>
                                <th>PRECIO</th>
                                <th>STOCK</th>
                                <th>ESTADO</th>
                                <th>ACCIONES</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="pr" items="${productos}">
                            <tr>
                                <td>${pr.getId()}</td>
                                <td>${pr.getNom()}</td>
                                <td>${pr.getPre()}</td>
                                <td>${pr.getSto()}</td>
                                <td>${pr.getEst()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Producto&accion=Editar&id=${pr.getId()}">Editar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=Producto&accion=Delete&id=${pr.getId()}">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>  
                            
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
