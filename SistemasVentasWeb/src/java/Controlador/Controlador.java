
package Controlador;

import Modelo.Cliente;
import Modelo.ClienteDAO;
import Modelo.Empleado;
import Modelo.EmpleadoDAO;
import Modelo.Producto;
import Modelo.ProductoDAO;
import Modelo.Venta;
import Modelo.VentaDAO;
import config.GenerarSerie;
import config.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Controlador extends HttpServlet {
    
    Empleado em=new Empleado();//entidad
    EmpleadoDAO edao=new EmpleadoDAO();//clase empleado dao
    int ide;
    
    Cliente cl=new Cliente();//entidad
    ClienteDAO cdao=new ClienteDAO();//clase empleado dao
    int idc;
    
    Producto pr=new Producto();//entidad
    ProductoDAO pdao=new ProductoDAO();//clase empleado dao
    int idp;
    
    //instanciar venta
    Venta ve=new Venta();//entidad
    VentaDAO vdao=new VentaDAO();//clase empleado dao
    int idv;
    
    List<Venta>lista=new ArrayList<>();
    int item;
    int cod;
    String descripcion;
    Double precio;
    int cant;
    Double subtotal;
    Double totalPagar;
    
    String numeroserie;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if (menu.equals("Principal")) {
            request.getRequestDispatcher("Principal.jsp").forward(request, response);
        }
        if (menu.equals("Empleado")) {
            switch(accion){
                case "Listar":
                    List lista=edao.listar();
                    request.setAttribute("empleados", lista);
                    break;
                case "Agregar":
                    String dni=request.getParameter("txtDni");
                    String nom=request.getParameter("txtNombres");
                    String tel=request.getParameter("txtTel");
                    String est=request.getParameter("txtEstado");
                    String user=request.getParameter("txtUser");
                    em.setDni(dni);
                    em.setNom(nom);
                    em.setTel(tel);
                    em.setEstado(est);
                    em.setUser(user);
                    edao.agregar(em);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    ide=Integer.parseInt(request.getParameter("id"));
                    Empleado e=edao.listarId(ide);
                    request.setAttribute("empleado", e);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String dni1=request.getParameter("txtDni");
                    String nom1=request.getParameter("txtNombres");
                    String tel1=request.getParameter("txtTel");
                    String est1=request.getParameter("txtEstado");
                    String user1=request.getParameter("txtUser");
                    em.setDni(dni1);
                    em.setNom(nom1);
                    em.setTel(tel1);
                    em.setEstado(est1);
                    em.setUser(user1);
                    em.setId(ide);
                    edao.actualizar(em);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                case "Delete":
                    ide=Integer.parseInt(request.getParameter("id"));
                    edao.delete(ide);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Empleado.jsp").forward(request, response);
        }
        if (menu.equals("Clientes")) {
            switch(accion){
                case "Listar":
                    List lista=cdao.listar();
                    request.setAttribute("clientes", lista);
                    break;
                case "Agregar":
                    String dni=request.getParameter("txtDni");
                    String nom=request.getParameter("txtNom");
                    String dir=request.getParameter("txtDir");
                    String es=request.getParameter("txtEs");
                    cl.setDni(dni);
                    cl.setNom(nom);
                    cl.setDir(dir);
                    cl.setEs(es);
                    cdao.agregar(cl);
                    request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                    break;
                
                case "Editar":
                    idc=Integer.parseInt(request.getParameter("id"));
                    Cliente c=cdao.listarId(idc);
                    request.setAttribute("cliente", c);
                    request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String dni2=request.getParameter("txtDni");
                    String nom2=request.getParameter("txtNom");
                    String dir2=request.getParameter("txtDir");
                    String es2=request.getParameter("txtEs");
                    cl.setDni(dni2);
                    cl.setNom(nom2);
                    cl.setDir(dir2);
                    cl.setEs(es2);
                    cl.setId(idc);
                    cdao.actualizar(cl);
                    request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                    break;
                case "Delete":
                    idc=Integer.parseInt(request.getParameter("id"));
                    cdao.delete(idc);
                    request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Clientes.jsp").forward(request, response);
        }
        if (menu.equals("Producto")) {
            switch(accion){
                case "Listar":
                    List lista=pdao.listar();
                    request.setAttribute("productos", lista);
                    break;
                case "Agregar":
                    String nom=request.getParameter("txtNom");
                    double pre=Double.parseDouble(request.getParameter("txtPre"));
                    int sto=Integer.parseInt(request.getParameter("txtSto"));
                    String est=request.getParameter("txtEst");
                    pr.setNom(nom);
                    pr.setPre(pre);
                    pr.setSto(sto);
                    pr.setEst(est);
                    pdao.agregar(pr);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    idp=Integer.parseInt(request.getParameter("id"));
                    Producto p=pdao.listarId(idp);
                    request.setAttribute("producto", p);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String nom3=request.getParameter("txtNom");
                    double pre3=Double.parseDouble(request.getParameter("txtPre"));
                    int sto3=Integer.parseInt(request.getParameter("txtSto"));
                    String est3=request.getParameter("txtEst");
                    pr.setNom(nom3);
                    pr.setPre(pre3);
                    pr.setSto(sto3);
                    pr.setEst(est3);
                    pr.setId(idp);
                    pdao.actualizar(pr);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                case "Delete":
                    idp=Integer.parseInt(request.getParameter("id"));
                    pdao.delete(idp);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Producto.jsp").forward(request, response);
        }
        if (menu.equals("NuevaVenta")) {
            switch(accion){
                case "BuscarCliente":
                    
                    String dni=request.getParameter("codigocliente");
                    cl.setDni(dni);
                    cl=cdao.buscar(dni);
                    request.setAttribute("cl", cl);
                    request.setAttribute("nserie", numeroserie);
                    break;
                case "BuscarProducto":
                    request.setAttribute("nserie", numeroserie);
                    int id=Integer.parseInt(request.getParameter("codigoproducto"));
                    pr=pdao.listarId(id);
                    request.setAttribute("cl", cl);
                    request.setAttribute("pr" ,pr);
                    request.setAttribute("lista", lista);
                    request.setAttribute("totalpagar", totalPagar);
                    break;
                case "Agregar":
                    request.setAttribute("nserie", numeroserie);
                    request.setAttribute("cl", cl);
                    totalPagar=0.0;
                    item =item + 1;
                    cod=pr.getId();
                    descripcion=request.getParameter("nomproducto");
                    precio=Double.parseDouble(request.getParameter("precio"));
                    cant=Integer.parseInt(request.getParameter("cant"));
                    subtotal=precio*cant;
                    ve=new Venta();
                    ve.setItem(item);
                    ve.setIdproducto(cod);
                    ve.setDescripcionP(descripcion);
                    ve.setPrecio(precio);
                    ve.setCantidad(cant);
                    ve.setSubtotal(subtotal);
                    lista.add(ve);
                    for (int i = 0; i < lista.size(); i++) {
                        totalPagar=totalPagar+lista.get(i).getSubtotal();
                    }
                    request.setAttribute("totalpagar", totalPagar);
                    request.setAttribute("lista", lista);
                    break;
                case "GenerarVenta":
                    request.setAttribute("nserie", numeroserie);
                    //guardar venta
                    ve.setIdcliente(cl.getId());
                    ve.setIdempleado(2);
                    ve.setNumserie(numeroserie);
                    java.util.Date ahora=new java.util.Date();
                    SimpleDateFormat formateador = new SimpleDateFormat("yyy/MM/dd");
                    ve.setFecha(formateador.format(ahora));
                    ve.setMonto(totalPagar);
                    ve.setEstado("1");
                    vdao.guardarVenta(ve);
                    //guardar detalle ventas
                    int idv=Integer.parseInt(vdao.IdVentas());
                    for (int i = 0; i < lista.size(); i++) {
                        ve=new Venta();
                        //encabezado de sql
                        ve.setId(idv);
                        ve.setIdproducto(lista.get(i).getIdproducto());
                        ve.setCantidad(lista.get(i).getCantidad());
                        ve.setPrecio(lista.get(i).getPrecio());
                        vdao.guardarDetalleventas(ve);
                    }
                    break;
                default:
                    ve=new Venta();
                    lista=new ArrayList<>();
                    item=0;
                    totalPagar=0.0;
                    
                    numeroserie=vdao.GenerarSerie();
                    if (numeroserie==null) {
                        numeroserie="00000001";
                        request.setAttribute("nserie", numeroserie);
                    }
                    else {
                        int incrementar=Integer.parseInt(numeroserie);
                        GenerarSerie gs=new GenerarSerie();
                        numeroserie=gs.NumeroSerie(incrementar);
                        request.setAttribute("nserie", numeroserie);
                    }
                    request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
            }
            request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
        }
        
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
