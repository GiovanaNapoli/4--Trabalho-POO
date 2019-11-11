<%-- 
    Document   : produto-manufacture
    Created on : 08/11/2019, 00:08:46
    Author     : giova
--%>

<%@page import="br.fatecpg.db.Detalhes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/main.css">
        <title>Detalhes</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/navbar.jspf" %>
        <%if (request.getParameter("i") == null) {%>
            <div>Indicie não encontrado</div>
        <%} else {%>
            <%try {%>
            <%int i = Integer.parseInt(request.getParameter("i"));%>
            <br>
            <br>
            <br>
            <table>
                <tr>
                    <th>CUSTOMER_ID</th>
                    <th>PRODUCT_ID</th>
                    <th>QUANTIDADE</th>
                    <th>PREÇO</th>
                    <th>DATA DE COMPRA</th>
                </tr>
                <%for (Detalhes ds : Detalhes.getList(i)) {%>
                    <tr>
                        <td><%=i%></td>
                        <td><%=ds.getId()%></td>
                        <td><%=ds.getQt()%></td>
                        <td>R$ <%=String.format("%1$,.2f",ds.getPreco())%></td>
                        <td><%=ds.getData()%></td>
                </tr>
                <%}%>
            </table>
            <%} catch (Exception e) {%>
                <tr>
                    <td colspan="3">Erro <%= e.getMessage()%></td>
                </tr>
            <%}%>
        <%}%>
    </body>
</html>
