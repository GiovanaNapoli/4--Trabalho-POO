<%-- 
    Document   : fabricas
    Created on : 07/11/2019, 22:24:03
    Author     : giova
--%>

<%@page import="br.fatecpg.db.Manufacture"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/main.css">
        <title>Fabricas</title>
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
                <%for(Manufacture m: Manufacture.getList()){%>
                <tr>
                    <td><a href="#">Ver produtos</a></td>
                    <td><%=m.getId()%></td>
                    <td><%=m.getName()%></td>
                    <td><%=m.getEmail()%></td>
                </tr>
                <%}%>
            <%}catch(Exception e){%>
                <tr><td colspan="3">Erro <%= e.getMessage()%></td></tr>
            <%}%>
        </table>
    </body>
</html>
