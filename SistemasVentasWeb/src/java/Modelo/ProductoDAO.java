
package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    int p;
    
    public Producto buscar(int id){
        Producto p=new Producto();
        String sql="select * from producto where idproducto="+id;
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()){
                p.setId(rs.getInt(1));
                p.setNom(rs.getString(2));
                p.setPre(rs.getDouble(3));
                p.setSto(rs.getInt(4));
                p.setEst(rs.getString(5));
            }
        } catch (Exception e) {
        }
        
        return p;
    }
    public int actualizarstock(int id,int stock){
        String sql="update producto set Stock=? where Idproducto=?";
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setInt(1, stock);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
    
    
    //Operaciones CRUD
    
    public List listar(){
    String sql="select * from producto";
    List<Producto>lista=new ArrayList<>();
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()){
                Producto pr=new Producto();
                pr.setId(rs.getInt(1));
                pr.setNom(rs.getString(2));
                pr.setPre(rs.getDouble(3));
                pr.setSto(rs.getInt(4));
                pr.setEst(rs.getString(5));
                lista.add(pr);
            }
        } catch (Exception e) {
        }
        return lista; 
    }
    public int agregar(Producto pr){
        String sql="insert into producto(Nombres, Precio, Stock, Estado) values(?,?,?,?)";
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setString(1, pr.getNom());
            ps.setDouble(2, pr.getPre());
            ps.setInt(3, pr.getSto());
            ps.setString(4, pr.getEst());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
    
                    public Producto listarId(int id){
                        Producto pro=new Producto();
                        String sql="select * from producto where IdProducto="+id;
                        try {
                            con=cn.Conexion();
                            ps=con.prepareStatement(sql);
                            rs=ps.executeQuery();
                            while (rs.next()){
                                
                                pro.setNom(rs.getString(2));
                                pro.setPre(rs.getDouble(3));
                                pro.setSto(rs.getInt(4));
                                pro.setEst(rs.getString(5));
                            }
                        }catch (Exception e) {
                        }
                        return pro;

                    }
    public int actualizar(Producto pr){
        String sql="update producto set Nombres=?, Precio=?, Stock=?, Estado=? where IdProducto=?";
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            
            ps.setString(1, pr.getNom());
            ps.setDouble(2, pr.getPre());
            ps.setInt(3, pr.getSto());
            ps.setString(4, pr.getEst());
            ps.setInt(5, pr.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
    public void delete(int id){
        String sql="delete from producto where IdProducto="+id;
        try{
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
        
        }
    }
}
