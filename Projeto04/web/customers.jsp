<%-- 
    Document   : customers
    Created on : 07/11/2019, 22:24:15
    Author     : giova
--%>

<%@page import="br.fatecpg.db.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/main.css">
        <title>Clientes</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/navbar.jspf" %>
        <br>
        <br>
        <br>
        <table>
            <tr>
                <th>COMANDOS</th>
                <th>ID</th>
                <th>NOME</th>
                <th>EMAIL</th>
            </tr>
            <%try{%>
                <%for(Customer c: Customer.getList()){%>
                <tr>
                    <td><a href="#">Ver produtos</a></td>
                    <td><%=c.getId()%></td>
                    <td><%=c.getName()%></td>
                    <td><%=c.getEmail()%></td>
                </tr>
                <%}%>
            <%}catch(Exception e){%>
                <tr><td colspan="3">Erro <%= e.getMessage()%></td></tr>
            <%}%>
        </table>
    </body>
</html>
