package br.fatecpg.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Product {
    private int id;
    private String codigo;
    private double preco;
    private String status;
    private String descricao;

    public Product(int id, String codigo, double preco, String status, String descricao) {
        this.id = id;
        this.codigo = codigo;
        this.preco = preco;
        this.status = status;
        this.descricao = descricao;
    }
    
    public static ArrayList<Product> getList(int id) throws Exception{
        ArrayList<Product> list = new ArrayList();
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        String url = "jdbc:derby://localhost:1527/sample";
        String user = "app";
        String password = "app";
        Connection con = DriverManager.getConnection(url, user, password);
        Statement stmt = con.createStatement();
        String sql = "SELECT PRODUCT_ID, PRODUCT_CODE, PURCHASE_COST, AVAILABLE, DESCRIPTION FROM APP.PRODUCT WHERE MANUFACTURER_ID = " + id;
        ResultSet rs = stmt.executeQuery(sql);
        while(rs.next()){
            Product p = new Product(
                    rs.getInt("PRODUCT_ID"),
                    rs.getString("PRODUCT_CODE"),
                    rs.getInt("PURCHASE_COST"),
                    rs.getString("AVAILABLE"),
                    rs.getString("DESCRIPTION")
            );
            list.add(p);
        }
        rs.close();stmt.close();con.close();
        return list;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    
    
    
}
