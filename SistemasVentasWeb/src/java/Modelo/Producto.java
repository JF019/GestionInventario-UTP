
package Modelo;


public class Producto {
    int id;
    String nom;
    Double pre;
    int sto;
    String est;

    
    public Producto() {
    }

    public Producto(int id, String nom, Double pre, int sto, String est) {
        this.id = id;
        this.nom = nom;
        this.pre = pre;
        this.sto = sto;
        this.est = est;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Double getPre() {
        return pre;
    }

    public void setPre(Double pre) {
        this.pre = pre;
    }

    public int getSto() {
        return sto;
    }

    public void setSto(int sto) {
        this.sto = sto;
    }

    public String getEst() {
        return est;
    }

    public void setEst(String est) {
        this.est = est;
    }

    

    
    
    
}
