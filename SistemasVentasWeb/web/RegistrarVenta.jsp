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
        <title>VENTAS</title>
    </head>
    <body>
        <div class="container d-flex ">

            <div class="col-sm-4">
                <div class="card my-1">
                    <div class="card-body">
                        <form action="Controlador?menu=NuevaVenta" method="POST">
                            <div class="form-group my-3">
                                <h4>Datos del cliente</h4>
                            </div>
                            <div class="form-group d-flex">
                                <div class="col-sm-6 d-flex">
                                    <input type="text" name="codigocliente" value="${cl.getDni()}" class="form-control mx-1 " placeholder="Codigo">
                                    <button type="submit" name="accion" value="BuscarCliente" class="btn btn-outline-primary mx-3" >buscar</button>
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" name="nombrescliente" value="${cl.getNom()}" class="form-control mx-1 " placeholder="Datos Cliente">
                                </div>
                            </div>

                            <div class="form-group my-3">
                                <h4>Datos del Producto</h4>
                            </div>
                            <div class="form-group d-flex">
                                <div class="col-sm-6 d-flex">
                                    <input type="text" name="codigoproducto"  value="${pr.getId()}" class="form-control mx-1" placeholder="Codigo">
                                    <button type="submit" name="accion" value="BuscarProducto" class="btn btn-outline-primary mx-3" >buscar</button>

                                </div>

                                <div class="col-sm-6">
                                    <input type="text" name="nomproducto" value="${pr.getNom()}" class="form-control mx-1" placeholder="Datos Producto">
                                </div>
                            </div>


                            <div class="form-group my-4 d-flex">
                                <div class="col-sm-6 d-flex">
                                    <input type="text" name="precio" value="${pr.getPre()}" class="form-control mx-1" placeholder="s/.0.00">
                                </div>
                                <div class="col-sm-4 d-flex">
                                    <input type="text" name="stock"  value="${pr.getSto()}" class="form-control mx-1" placeholder="Stock">
                                </div>
                                <div class="col-sm-2 ">
                                    <input type="number" name="cant" class="form-control mx-1" placeholder="#">
                                </div>

                            </div>
                            <div class="form-group">
                                <button type="submit" name="accion" value="Agregar" class="btn btn-outline-primary">Agregar Producto</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
            <div class="container d-flex">
                <div class="col-sm-12">
                    <div class="card my-1">
                        <div class="card-body">
                            <div class="d-flex">
                                <div class="form-group my-0 ">
                                    <h4>Producto</h4>
                                </div>
                                <div class="form-group col-sm-6 d-grid gap-2 d-md-flex justify-content-md-end">
                                    <div class=" d-flex ">
                                        <label class=" my-2 mx-2">Nro.Serie:</label>
                                        <input type="text" name="NroSerie" value="${nserie}" class="form-control ">
                                    </div>
                                </div>
                            </div>
                            <br>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Nro</th>
                                        <th>Codigo</th>
                                        <th>Descripcion</th>
                                        <th>Precio</th>
                                        <th>Cantidad</th>
                                        <th>Subtotal</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="list" items="${lista}">
                                        <tr>
                                            <td>${list.getItem()}</td>
                                            <td>${list.getIdproducto()}</td>
                                            <td>${list.getDescripcionP()}</td>
                                            <td>${list.getPrecio()}</td>
                                            <td>${list.getCantidad()}</td>
                                            <td>${list.getSubtotal()}</td>
                                            <td class="d-flex ">
                                                <a class="btn btn-warning mx-1" href="Controlador?menu=NuevaVenta&accion=Editar&id=${em.getId()}">Editar</a>
                                                <a class="btn btn-danger" href="Controlador?menu=NuevaVenta&accion=Delete&id=${em.getId()}">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>
                        <div class="card-footer d-flex  ">
                            <div class="col-sm-6 ">
                                <a href="Controlador?menu=NuevaVenta&accion=GenerarVenta">Generar Venta</a>
                                
                                <input type="submit" name="accion" value="Cancelar" class="btn btn-danger">
                            </div>
                            <div class="col-sm-3 ml-auto ">
                                <input type="text" name="txtTotal" value="S/.  ${totalpagar}0" class="form-control">
                            </div>
                        </div>

                    </div>

                </div>
            </div>

        </div>
    </body>
</html>
