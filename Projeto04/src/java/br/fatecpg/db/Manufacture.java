package br.fatecpg.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Manufacture {
    private int id;
    private String name;
    private String city;
    private String state;
    private String email;
    
    public static ArrayList<Manufacture> getList()throws Exception{
        ArrayList<Manufacture> list = new ArrayList();
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        String url = "jdbc:derby://localhost:1527/sample";
        String user = "app";
        String password = "app";
        Connection con = DriverManager.getConnection(url, user, password);
        Statement stmt = con.createStatement();
        String sql = "SELECT MANUFACTURER_ID, NAME, CITY, STATE, EMAIL FROM APP.MANUFACTURER";
        ResultSet rs = stmt.executeQuery(sql);
        while(rs.next()){
            Manufacture m = new Manufacture(
                    rs.getInt("MANUFACTURER_ID"),
                    rs.getString("NAME"),
                    rs.getString("CITY"),
                    rs.getString("STATE"),
                    rs.getString("EMAIL")
            );
            list.add(m);
        }
        rs.close();stmt.close();con.close();
        return list;
    }

    public Manufacture(int id, String name, String city, String state, String email) {
        this.id = id;
        this.name = name;
        this.city = city;
        this.state = state;
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
