package br.fatecpg.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Detalhes {
    private int id;
    private String endereço1;
    private String endereço2;
    private String cidade;
    private double limite; 

    public Detalhes(int id, String endereço1, String endereço2, String cidade, double limite) {
        this.id = id;
        this.endereço1 = endereço1;
        this.endereço2 = endereço2;
        this.cidade = cidade;
        this.limite = limite;
    }
        public static ArrayList<Detalhes> getList(int id) throws Exception{
        ArrayList<Detalhes> list = new ArrayList();
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        String url = "jdbc:derby://localhost:1527/sample";
        String user = "app";
        String password = "app";
        Connection con = DriverManager.getConnection(url, user, password);
        Statement stmt = con.createStatement();
        String sql = "SELECT CUSTOMER_ID, ADRESSLINE1, ADRESSLINE2, CITY, CREDIT_LIMIT FROM APP.DETALHES WHERE CUSTOMER_ID = " + id;
        ResultSet ds = stmt.executeQuery(sql);
        while(ds.next()){
            Detalhes d = new Detalhes(
                    ds.getInt("CUSTOMER_ID"),
                    ds.getString("ADRESSLINE1"),
                    ds.getString("ADRESSLINE2"),
                    ds.getString("CITY"),
                    ds.getDouble("CREDIT_LIMIT")
            );
            list.add(d);
        }
        ds.close();stmt.close();con.close();
        return list;
    }
    
    
    public String getEndereço1() {
        return endereço1;
    }

    public void setEndereço1(String endereço1) {
        this.endereço1 = endereço1;
    }
    public String getEndereço2() {
        return endereço1;
    }

    public void setEndereço2(String endereço2) {
        this.endereço2 = endereço2;
    }

    public double getLimite() {
        return limite;
    }

    public void setLimite(double limite) {
        this.limite = limite;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    
    
    
    
}
