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
                    <th>ENDEREÇO_1</th>
                    <th>ENDEREÇO_2</th>
                    <th>CIDADE</th>
                    <th>LIMITE_CREDITO</th>
                </tr>
                <%for (Detalhes ds : Detalhes.getList(i)) {%>
                    <tr>
                        <td><%=ds.getId()%></td>
                        <td><%=ds.getEndereço1()%></td>
                        <td><%=ds.getEndereço2()%></td>
                        <td><%=ds.getCidade()%></td>
                        <td>R$ <%=String.format("%1$,.2f",ds.getLimite())%></td>
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
