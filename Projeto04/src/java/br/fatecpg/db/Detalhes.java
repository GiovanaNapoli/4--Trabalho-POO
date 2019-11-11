package br.fatecpg.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Detalhes {
    private int id;
    private int qt;
    private double preco;
    private String data;

    public Detalhes(int id, int qt, double preco, String data) {
        this.id = id;
        this.qt = qt;
        this.preco = preco;
        this.data = data;
    }

    public static ArrayList<Detalhes> getList(int id) throws Exception {
        ArrayList<Detalhes> list = new ArrayList();
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        String url = "jdbc:derby://localhost:1527/sample";
        String user = "app";
        String password = "app";
        Connection con = DriverManager.getConnection(url, user, password);
        Statement stmt = con.createStatement();
        String sql = "SELECT PRODUCT_ID, QUANTITY, SHIPPING_COST, SALES_DATE FROM APP.PURCHASE_ORDER WHERE CUSTOMER_ID = " + id;
        ResultSet ds = stmt.executeQuery(sql);
        while (ds.next()) {
            Detalhes d = new Detalhes(
                    ds.getInt("PRODUCT_ID"),
                    ds.getInt("QUANTITY"),
                    ds.getDouble("SHIPPING_COST"),
                    ds.getString("SALES_DATE")
            );
            list.add(d);
        }
        ds.close();
        stmt.close();
        con.close();
        return list;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQt() {
        return qt;
    }

    public void setQt(int qt) {
        this.qt = qt;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }  
}
