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
                <th>ID</th>
                <th>NOME</th>
                <th>EMAIL</th>
                <th>CIDADE</th>
                <th>ESTADO</th>
                
            </tr>
            <%try{%>
                <%for(Manufacture m: Manufacture.getList()){%>
                <tr>
                    <%int i = Manufacture.getIndex(m);%>
                    <td><a href="produto-manufacture.jsp?i=<%=m.getId()%>"><%=m.getId()%></a></td>
                    <td><%=m.getName()%></td>
                    <td><%=m.getEmail()%></td>
                    <td><%=m.getCity()%></td>
                    <td><%=m.getState()%></td>
                </tr>
                <%}%>
            <%}catch(Exception e){%>
                <tr><td colspan="3">Erro <%= e.getMessage()%></td></tr>
            <%}%>
        </table>
    </body>
</html>
